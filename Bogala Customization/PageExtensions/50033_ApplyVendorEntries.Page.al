pageextension 50033 ApplyVendorEntries extends "Apply Vendor Entries"
{
    layout
    {
        addafter(Positive)
        {
            field("Amount (LCY)"; Rec."Amount (LCY)")
            {
                ApplicationArea = All;
            }
        }
    }
}