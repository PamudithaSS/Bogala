reportextension 50004 CustomerPayReceipt extends "Customer - Payment Receipt"
{
    dataset
    {
        add(PageLoop)
        {
            column(CustLedgerEntryExternalDocumentNo; "Cust. Ledger Entry"."External Document No.")
            { }
            column(GLEntryJournalBatchName; "Cust. Ledger Entry"."No. Series")
            { }
            column(CompanyInfoPicture; CompanyInfoUp.Picture)
            { }
            column(CompanyInfoName; CompanyInfoUp.Name)
            { }
            column(CompanyInfoFaxNo; CompanyInfoUp."Fax No.")
            { }
            column(CompanyInfoSVATRegistrationNo; CompanyInfoUp."SVAT Registration No.")
            { }
            column(CompanyInfoPostCode; CompanyInfoUp."Post Code")
            { }
            column(FormatNext1; FormatNext[1])
            { }
            column(FormatNext2; FormatNext[2])
            { }
            column(FormatNext3; FormatNext[3])
            { }
            column(CurrencyCodeValue; "Cust. Ledger Entry"."Currency Code")
            { }
        }
        modify(PageLoop)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Check.InitTextVariable;
                Check.FormatNoText(FormatNext, ABS("Cust. Ledger Entry"."Original Amount"), '');
            end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfoUp.Get();
        CompanyInfoUp.CALCFIELDS(Picture);
    end;

    var
        CompanyInfoUp: Record "Company Information";
        Check: Report Check;
        FormatNext: array[3] of Text[350];
}