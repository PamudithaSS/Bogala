report 50052 "Update Purchase Order Status"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = where(Status = filter('Pending Approval'), "Document Type" = filter(Order));
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                Status := Status::Open;
                Modify();
            end;
        }

    }
    trigger OnPostReport()
    begin
        Message('Updated');
    end;
}