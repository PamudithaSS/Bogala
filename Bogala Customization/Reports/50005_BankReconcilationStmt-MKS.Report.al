report 50005 "Bank Reconcilation Stmt - MKS"
{
    //  0.01 LK 01Apl2013 -  create report to display Unrealized/ Unprsented cheques
    //DefaultLayout = RDLC;
    RDLCLayout = './Reports/Bank Reconcilation Stmt - MKS.rdl';

    dataset
    {
        dataitem("Bank Acc. Reconciliation"; "Bank Acc. Reconciliation")
        {
            RequestFilterFields = "Bank Account No.", "Statement No.";
            column(BankAccountNo_BankAccReconciliation; "Bank Acc. Reconciliation"."Bank Account No.")
            { }
            column(StatementNo_BankAccReconciliation; "Bank Acc. Reconciliation"."Statement No.")
            { }
            column(StatementEndingBalance_BankAccReconciliation; "Bank Acc. Reconciliation"."Statement Ending Balance")
            { }
            column(StatementDate_BankAccReconciliation; "Bank Acc. Reconciliation"."Statement Date")
            { }
            column(BalanceLastStatement_BankAccReconciliation; "Bank Acc. Reconciliation"."Balance Last Statement")
            { }
            column(CompanyInfo_Name; CompanyInfo.Name)
            { }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            { }
            column(Bank_Name; Bank.Name)
            { }
            dataitem("Bank Acc. Reconciliation Line"; "Bank Acc. Reconciliation Line")
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No."), "Statement No." = FIELD("Statement No.");
                DataItemTableView = SORTING("Bank Account No.", "Statement No.", "Statement Line No.") WHERE("Ready for Application" = FILTER(false));
                column(BankAccountNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Bank Account No.")
                { }
                column(StatementNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Statement No.")
                { }
                column(StatementLineNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Statement Line No.")
                { }
                column(DocumentNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Document No.")
                { }
                column(TransactionDate_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Transaction Date")
                { }
                column(Description_BankAccReconciliationLine; "Bank Acc. Reconciliation Line".Description)
                { }
                column(StatementAmount_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Statement Amount")
                { }
                column(ReadyforApplication_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Ready for Application")
                { }
                column(CheckNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Check No.")
                { }
                column(UnPresented; UnPresented)
                { }
                column(UnPresentedAmount; UnPresentedAmount)
                { }
                column(UnRealizedAmount; UnRealizedAmount)
                { }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(UnPresented);
                    IF "Bank Acc. Reconciliation Line"."Statement Amount" > 0 THEN BEGIN
                        UnRealizedAmount := UnRealizedAmount + "Bank Acc. Reconciliation Line"."Statement Amount";
                        UnPresented := 1;
                    END
                    ELSE BEGIN
                        UnPresentedAmount := UnPresentedAmount + "Bank Acc. Reconciliation Line"."Statement Amount";
                        UnPresented := 2;
                    END;
                end;

                trigger OnPreDataItem();
                begin
                    CLEAR(UnRealizedAmount);
                    CLEAR(UnPresentedAmount);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                Bank.RESET;
                IF Bank.GET("Bank Acc. Reconciliation"."Bank Account No.") THEN;
            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
            end;
        }
    }

    var
        UnRealizedAmount: Decimal;
        UnPresentedAmount: Decimal;
        UnPresented: Integer;
        CompanyInfo: Record "Company Information";
        Bank: Record "Bank Account";
}

