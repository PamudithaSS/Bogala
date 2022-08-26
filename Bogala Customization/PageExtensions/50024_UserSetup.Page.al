pageextension 50024 UserSetup extends "User Setup"
{
    layout
    {
        addafter("Sales Resp. Ctr. Filter")
        {
            field("Request Amount Approval Limit"; Rec."Request Amount Approval Limit")
            {
                ApplicationArea = All;
            }
            field("Unlimited Request Approval"; Rec."Unlimited Request Approval")
            {
                ApplicationArea = All;
            }
            field("Mobile Number"; Rec."Mobile Number")
            {
                ApplicationArea = All;
            }
            field(Location; Rec.Location)
            {
                ApplicationArea = All;
            }
        }
        addafter("Time Sheet Admin.")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
            }
            field("User Role Center"; Rec."User Role Center")
            {
                ApplicationArea = All;
            }
            field("Delete User Personalization"; Rec."Delete User Personalization")
            {
                ApplicationArea = All;
            }
            field("PO Delete"; "PO Delete")
            {
                ApplicationArea = All;
            }
        }
    }
}