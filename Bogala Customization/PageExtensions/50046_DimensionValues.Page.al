pageextension 50046 DimensionValues extends "Dimension Values"
{
    layout
    {
        addafter("Map-to IC Dimension Value Code")
        {
            field("Dimension Code"; Rec."Dimension Code")
            {
                ApplicationArea = All;
            }
            field("Dimension Value ID"; Rec."Dimension Value ID")
            {
                ApplicationArea = All;
            }
        }
    }
}