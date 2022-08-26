pageextension 50039 BankAccReconciliation extends "Bank Acc. Reconciliation"
{
    layout
    {
        addafter(StatementEndingBalance)
        {
            field("Sellect All"; Rec."Sellect All")
            {
                ApplicationArea = All;
            }
        }
    }
}