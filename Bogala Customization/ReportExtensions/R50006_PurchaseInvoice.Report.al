reportextension 50006 PurchaseInvoice extends "Purchase - Invoice"
{
    dataset
    {
        add(PageLoop)
        {
            column(CompanyInfoUpPicture; CompanyInfoUp.Picture)
            { }
        }
        modify("Purch. Inv. Header")

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