pageextension 50004 VendorList extends "Vendor List"
{
    layout
    {
        addbefore("Balance (LCY)")
        {
            field(Balance; Rec.Balance)
            {
                ApplicationArea = All;
            }
        }
        addafter("Base Calendar Code")
        {
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
            }
            field(City; Rec.City)
            {
                ApplicationArea = All;
            }
        }
    }
}