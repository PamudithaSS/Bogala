report 50033 "Print S-VAT credit voucher"
{
    // version Arjuna-JIT

    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Print S-VAT credit voucher.rdl';

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            DataItemTableView = WHERE("Account Type" = FILTER(Vendor));
            RequestFilterFields = "Document No.";
            column(PostingDate; "Posting Date")
            {
            }
            column(Description; Description)
            {
            }
            column(Amount; Amount)
            {
            }
            column(ComName; CompanyInformation.Name)
            {
            }
            column(ComVATRegistrationNo; CompanyInformation."VAT Registration No.")
            {
            }
            column(ComSVATRegistrationNo; CompanyInformation."SVAT Registration No.")
            {
            }
            column(VendorVATRegistrationNo; Vendor."VAT Registration No.")
            {
            }
            column(VendorSVATRegistrationNo; Vendor."SVAT Registration No.")
            {
            }
            column(Date; Date)
            {
            }
            column(WithTax; WithTax)
            {
            }
            column(ATaxtText; ATaxtText[1] + ATaxtText[2] + ATaxtText[3])
            {
            }
            column(AmountText; AmountText[1] + AmountText[2] + AmountText[3])
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF NOT Vendor.GET("Account No.") THEN
                    CLEAR(Vendor);

                IF Vat = 0 THEN
                    WithTax := ((Amount / 11) * 100)
                ELSE
                    WithTax := ((Amount / Vat) * 100);

                CLEAR(AmountInWord);
                AmountInWord.InitTextVariable;
                AmountInWord.FormatNoText(AmountText, ABS(ROUND(Amount, 0.01)), '');
                AmountInWord.FormatNoText(ATaxtText, ABS(ROUND(WithTax, 0.01)), '');
            end;

            trigger OnPreDataItem();
            begin
                CompanyInformation.GET;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Date; Date)
                {
                    ApplicationArea = All;
                }
                field("SVAT Amount"; Vat)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        CompanyInformation: Record "Company Information";
        Vendor: Record Vendor;
        Date: Date;
        Vat: Decimal;
        WithTax: Decimal;
        AmountInWord: Codeunit "Amount In Word";
        AmountText: array[3] of Text[100];
        ATaxtText: array[3] of Text[100];
}

