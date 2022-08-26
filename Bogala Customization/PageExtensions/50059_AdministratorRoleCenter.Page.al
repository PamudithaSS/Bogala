pageextension 50059 AdministratorRoleCenter extends "Administrator Role Center"
{
    actions
    {
        addafter("Check on Ne&gative Inventory")
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