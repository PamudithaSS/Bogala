report 50023 "TAX Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/TAX Statement.rdl';

    dataset
    {
        dataitem("VAT Entry"; "VAT Entry")
        {
            RequestFilterFields = Type, "Tax Jurisdiction Code", "Posting Date";
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoAddress; CompanyInfo.Address)
            {
            }
            column(CompanyInfoAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfoPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyInfoCounty; CompanyInfo.County)
            {
            }
            column(VATEntryTaxJurisdictionCode; "VAT Entry"."Tax Jurisdiction Code")
            {
            }
            column(VATEntryType; "VAT Entry".Type)
            {
            }
            column(VATEntryPostingDate; "VAT Entry"."Posting Date")
            {
            }
            column(Name; Name)
            {
            }
            column(Remarks; Remarks)
            {
            }
            column(VATEntryVATRegistrationNo; "VAT Entry"."VAT Registration No.")
            {
            }
            column(VATOrSVATNo; VATOrSVATNo)
            {
            }
            column(VATEntryDocumentNo; "VAT Entry"."Document No.")
            {
            }
            column(VATEntryExternalDocumentNo; "VAT Entry"."External Document No.")
            {
            }
            column(VATEntryBase; "VAT Entry".Base)
            {
            }
            column(VATEntryAmount; "VAT Entry".Amount)
            {
            }

            trigger OnAfterGetRecord();
            begin

                CLEAR(Name);
                CLEAR(Remarks);
                IF "VAT Entry".Type = 1 THEN BEGIN

                    IF Vendor.GET("Bill-to/Pay-to No.") THEN BEGIN
                        Name := Vendor.Name;
                        IF "VAT Entry"."Tax Jurisdiction Code" = 'VAT' THEN
                            VATOrSVATNo := ''
                        ELSE
                            IF "VAT Entry"."Tax Jurisdiction Code" = 'SVAT' THEN
                                VATOrSVATNo := Vendor."SVAT Registration No.";
                    END;


                    PurchInvoiceLine.RESET;
                    PurchInvoiceLine.SETRANGE(PurchInvoiceLine."Document No.", "VAT Entry"."Document No.");
                    IF PurchInvoiceLine.FINDFIRST THEN
                        Remarks := PurchInvoiceLine."Description 2";
                END
                ELSE
                    IF "VAT Entry".Type = 2 THEN BEGIN

                        IF Customer.GET("Bill-to/Pay-to No.") THEN BEGIN
                            Name := Customer.Name;
                            IF "VAT Entry"."Tax Jurisdiction Code" = 'VAT' THEN
                                VATOrSVATNo := ''
                            ELSE
                                IF "VAT Entry"."Tax Jurisdiction Code" = 'SVAT' THEN
                                    VATOrSVATNo := Customer."SVAT Registration No.";
                        END;



                        SalesInvoiceLine.RESET;
                        SalesInvoiceLine.SETRANGE(SalesInvoiceLine."Document No.", "VAT Entry"."Document No.");
                        IF SalesInvoiceLine.FINDFIRST THEN
                            Remarks := SalesInvoiceLine."Description 2";


                    END;
                BaseTotal += "VAT Entry".Base;
                AmountTotal += "VAT Entry".Amount;
            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        CompanyInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: Text[50];
        Remarks: Text[300];
        SalesInvoiceLine: Record "Sales Invoice Line";
        PurchInvoiceLine: Record "Purch. Inv. Line";
        BaseTotal: Decimal;
        AmountTotal: Decimal;
        GrandTotal: Decimal;
        Customer: Record Customer;
        Name: Text[100];
        Vendor: Record Vendor;
        VATOrSVATNo: Text[30];
}

