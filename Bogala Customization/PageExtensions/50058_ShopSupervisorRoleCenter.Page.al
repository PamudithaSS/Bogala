pageextension 50058 ShopSupervisorRoleCenter extends "Shop Supervisor Role Center"
{
    actions
    {
        addafter("S&tatus")
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