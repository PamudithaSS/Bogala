report 50004 "Payment Voucher Bank - MKS"
{
    //DefaultLayout = RDLC;
    RDLCLayout = './Reports/Payment Voucher Bank - MKS.rdl';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "Document No.";
            column(CompanyInfoPicture; CompanyInfo.Picture)
            { }
            column(Name_CompanyInfo; CompanyInfo.Name)
            { }
            column(Address_CompanyInfo; CompanyInfo.Address)
            { }
            column(Address2_CompanyInfo; CompanyInfo."Address 2")
            { }
            column(City_CompanyInfo; CompanyInfo.City)
            { }
            column(PhoneNo_CompanyInfo; CompanyInfo."Phone No.")
            { }
            column(FaxNo_CompanyInfo; CompanyInfo."Fax No.")
            { }
            column(VAT_CompanyInfo; CompanyInfo."VAT Registration No.")
            { }
            column(Picture_CompanyInfo; CompanyInfo.Picture)
            { }
            column(Text0001; Text0001)
            { }
            column(GLAccountNo_GLEntry; "G/L Entry"."G/L Account No.")
            { }
            column(PostingDate_GLEntry; "G/L Entry"."Posting Date")
            { }
            column(DocumentType_GLEntry; "G/L Entry"."Document Type")
            { }
            column(DocumentNo_GLEntry; "G/L Entry"."Document No.")
            { }
            column(Description_GLEntry; "G/L Entry".Description)
            { }
            column(Description2_GLEntry; "G/L Entry"."Description 2")
            { }
            column(DocumentDate_GLEntry; "G/L Entry"."Document Date")
            { }
            column(ExternalDocumentNo_GLEntry; "G/L Entry"."External Document No.")
            { }
            column(DebitAmount_GLEntry; "G/L Entry"."Debit Amount")
            { }
            column(CreditAmount_GLEntry; "G/L Entry"."Credit Amount")
            { }
            column(SourceNo_GLEntry; "G/L Entry"."Source No.")
            { }
            column(NumberText1; NumberText[1])
            { }
            column(NumberText2; NumberText[2])
            { }
            column(Name_GLAccount; GLAccount.Name)
            { }
            column(No_BankAccount; BankAccount."No.")
            { }
            column(BankAccountNo_BankAccount; BankAccount."Bank Account No.")
            { }

            trigger OnAfterGetRecord();
            begin
                IF Amount < 0 THEN BEGIN
                    BankAccount.RESET;
                    BankAccount.SETRANGE(BankAccount."No.", "G/L Entry"."Source No.");
                    IF BankAccount.FINDFIRST THEN;
                END;

                DbtAmount := DbtAmount + "Debit Amount";
                Check.InitTextVariable;
                Check.FormatNoText(NumberText, DbtAmount, '');

                GLAccount.RESET;
                GLAccount.SETRANGE(GLAccount."No.", "G/L Entry"."G/L Account No.");
                IF GLAccount.FINDFIRST THEN;
            end;
        }
    }
    trigger OnPreReport();
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        Text0001: Label 'Payment Voucher';
        Check: Report Check;
        NumberText: array[2] of Text[80];
        GLAccount: Record "G/L Account";
        BankAccount: Record "Bank Account";
        DbtAmount: Decimal;
}

