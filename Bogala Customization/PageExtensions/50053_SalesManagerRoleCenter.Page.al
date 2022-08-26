pageextension 50053 SalesManagerRoleCenter extends "Sales Manager Role Center"
{
    actions
    {
        addafter("Campaign - &Details")
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