pageextension 50057 WhseWorkerWMSRoleCenter extends "Whse. Worker WMS Role Center"
{
    actions
    {
        addafter("Customer &Labels")
        {
            Action(SalesDetailsIntern)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Sales Details Intern';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                RunObject = Report "TEST Sales Details_Intern";
            }
            Action(SalesDetailsGK)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Sales Details GK';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                RunObject = Report "Sales Details_GK TEST";
            }
        }
    }

}