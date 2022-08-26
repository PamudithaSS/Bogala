pageextension 50040 BankAccReconciliationLines extends "Bank Acc. Reconciliation Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Ready for Application"; Rec."Ready for Application")
            {
                ApplicationArea = All;
            }
        }
    }
}