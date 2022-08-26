pageextension 50047 FixedAssetList extends "Fixed Asset List"
{
    layout
    {
        addafter("No.")
        {
            field("Physical Identification Number"; Rec."Physical Identification Number")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = All;
            }
            field("FA Posting Group"; Rec."FA Posting Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Search Description")
        {
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
        }
    }
}