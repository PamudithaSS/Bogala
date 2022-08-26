reportextension 50003 SalesCreditMemo extends "Standard Sales - Credit Memo"
{
    dataset
    {
        add(Header)
        {
            column(CompanyInfoPicture; CompanyInfoUp.Picture)
            { }
        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                CompanyInfoUp.Get();
                CompanyInfoUp.CALCFIELDS(Picture);
            end;
        }
    }
    var
        CompanyInfoUp: Record "Company Information";
}
