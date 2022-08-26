report 50053 "Update JV"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Line No.";
            trigger OnAfterGetRecord()
            begin
                "Check Printed" := false;
                Modify();
            end;
        }
    }
    trigger OnPostReport()
    begin
        Message('Updated');
    end;
}