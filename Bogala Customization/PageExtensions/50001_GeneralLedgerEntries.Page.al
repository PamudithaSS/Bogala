pageextension 50001 GeneralLedgerEntries extends "General Ledger Entries"
{
    layout
    {
        // addafter("G/L Account Name")
        // {
        //     field("Source Type"; Rec."Source Type")
        //     {
        //         ApplicationArea = All;
        //     }
        //     field("Source No."; Rec."Source No.")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("FA Entry Type")
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
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        modify("Source Code")
        {
            Visible = false;
        }
        modify("Global Dimension 1 Code")
        {
            Visible = true;
        }
        modify("Global Dimension 2 Code")
        {
            Visible = true;
        }
        modify("IC Partner Code")
        {
            Visible = false;
        }
    }
}