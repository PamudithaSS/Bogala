pageextension 50005 VendorLedgerEntries extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Remaining Amount")
        {
            field(REM_TYPE; Rec.REM_TYPE)
            {
                ApplicationArea = All;
            }
            field(CHG_FROM; Rec.CHG_FROM)
            {
                ApplicationArea = All;
            }
        }
    }
}