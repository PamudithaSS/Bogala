reportextension 50008 PurchaseReceipt extends "Purchase - Receipt"
{
    dataset
    {
        add(PageLoop)
        {
            column(CompanyInfoFaxNo; CompanyInfoUp."Fax No.")
            { }
            column(CompanyInfoSVATRegNo; CompanyInfoUp."SVAT Registration No.")
            { }
            column(CompanyInfoPostCode; CompanyInfoUp."Post Code")
            { }
            column(CompanyInfoswiftcode; CompanyInfoUp."SWIFT Code")
            { }
            column(CompanyInfoUpPicture; CompanyInfoUp.Picture)
            { }
            column(PurchOrderNo; "Purch. Rcpt. Header"."Order No.")
            { }
            column(VendorShippmentNo; "Purch. Rcpt. Header"."Vendor Shipment No.")
            { }
            column(TaxAreaCode; "Purch. Rcpt. Header"."Tax Area Code")
            { }
        }
        modify("Purch. Rcpt. Header")
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