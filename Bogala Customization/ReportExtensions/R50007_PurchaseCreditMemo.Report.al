reportextension 50007 PurchaseCreditMemo extends "Purchase - Credit Memo"
{
    dataset
    {
        add(PageLoop)
        {
            column(CompanyInfoUpPicture; CompanyInfoUp.Picture)
            { }
        }
        modify("Purch. Cr. Memo Hdr.")
        {
            trigger OnAfterAfterGetRecord()
            begin
                CompanyInfoUp.GET;
                CompanyInfoUp.CALCFIELDS(Picture);
            end;
        }
    }
    var
        CompanyInfoUp: Record "Company Information";
}