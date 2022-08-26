pageextension 50002 CustomerList extends "Customer List"
{
    layout
    {
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
            field("Application Name"; ApplicationName)
            {
                ApplicationArea = All;
            }
            field("Region Name"; RegionName)
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        GetDimensionValue();
    end;

    var
        ApplicationName: Text[50];
        RegionName: Text[50];

    PROCEDURE GetDimensionValue();
    VAR
        DefaultDimension: Record "Default Dimension";
        DimensionValue: Record "Dimension Value";
    BEGIN
        CLEAR(ApplicationName);
        CLEAR(RegionName);
        DefaultDimension.RESET;
        DefaultDimension.SETRANGE("Table ID", 18);
        DefaultDimension.SETRANGE("No.", Rec."No.");
        IF DefaultDimension.FINDSET THEN
            REPEAT
                IF DefaultDimension."Dimension Code" = 'APPLICATION' THEN BEGIN
                    IF DimensionValue.GET('APPLICATION', DefaultDimension."Dimension Value Code") THEN
                        ApplicationName := DimensionValue.Name;
                END;
                IF DefaultDimension."Dimension Code" = 'REGION' THEN BEGIN
                    IF DimensionValue.GET('REGION', DefaultDimension."Dimension Value Code") THEN
                        RegionName := DimensionValue.Name;
                END;
            UNTIL DefaultDimension.NEXT = 0;
    END;

}