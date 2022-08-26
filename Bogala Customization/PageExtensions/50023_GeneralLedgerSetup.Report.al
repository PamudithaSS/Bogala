pageextension 50023 GeneralLedgerSetup extends "General Ledger Setup"
{
    layout
    {
        addlast(General)
        {
            field("Export File Path"; Rec."Export File Path")
            {
                ApplicationArea = All;
            }
        }
        addafter("Payment Tolerance Warning")
        {
            field("Instruction for Charges"; Rec."Instruction for Charges")
            {
                ApplicationArea = All;
            }
        }
    }
}