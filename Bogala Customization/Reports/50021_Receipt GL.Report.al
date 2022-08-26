report 50021 "Receipt GL"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Receipt GL.rdl';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = WHERE("Credit Amount" = FILTER(> 0));
            RequestFilterFields = "Document No.";
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
            column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfoVATRegistrationNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyInfoSVATRegistrationNo; CompanyInfo."SVAT Registration No.")
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(G_LEntryEntryNo; "G/L Entry"."Entry No.")
            {
            }
            column(G_LEntryDocumentNo; "G/L Entry"."Document No.")
            {
            }
            column(G_LEntryPostingDate; "G/L Entry"."Posting Date")
            {
            }
            column(G_LEntryExternalDocumentNo; "G/L Entry"."External Document No.")
            {
            }
            column(G_LEntryUserID; "G/L Entry"."User ID")
            {
            }
            column(G_LEntryGLAccountNo; "G/L Entry"."G/L Account No.")
            {
            }
            column(G_LEntryDescription; "G/L Entry".Description)
            {
            }
            column(G_LEntryDescription2; "G/L Entry"."Description 2")
            {
            }
            column(G_LEntryDebitAmount; "G/L Entry"."Debit Amount")
            {
            }
            column(G_LEntryCreditAmount; "G/L Entry"."Credit Amount")
            {
            }
            column(Total; Total)
            {
            }
            column(NumberText1; NumberText[1])
            {
            }
            column(NumberText2; NumberText[2])
            {
            }
            column(NumberText3; NumberText[3])
            {
            }
            column(GLEntryJournalBatchName; "G/L Entry"."No. Series")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Check.InitTextVariable;
                //MESSAGE(FORMAT("G/L Entry".Amount));
                "G/L Entry".SETFILTER("G/L Entry"."Credit Amount", '>%1', 0);
                "G/L Entry".CALCSUMS(Amount);
                Check.FormatNoText(NumberText, ABS("G/L Entry".Amount), '');
            end;

            trigger OnPreDataItem();
            begin
                IF "G/L Entry"."Source Type" = 3 THEN BEGIN
                    //CurrReport.SHOWOUTPUT:=FALSE;               //MR

                    Total := Total + "G/L Entry".Amount;
                END
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

    trigger OnPreReport();
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        GLAccount: Record "G/L Entry";
        RVBankAcc: Record "Bank Account";
        RVVendor: Record Vendor;
        RVGLentry: Record "G/L Entry";
        RVCompanyInfo: Record "Company Information";
        Usersetup: Record "User Setup";
        Check: Report Check;
        NumberText: array[3] of Text[50];
        Total: Decimal;
        CRAmount: Decimal;
}

