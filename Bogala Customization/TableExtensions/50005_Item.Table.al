tableextension 50005 Item extends Item
{
    fields
    {
        field(50000; "Qty. on Purch. Quote"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Outstanding Qty. (Base)" where("Document Type" = const(Quote), Type = const(Item), "No." = field("No."),
                            "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"), "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                            "Location Code" = field("Location Filter"), "Drop Shipment" = field("Drop Shipment Filter"), "Variant Code" = field("Variant Filter"),
                            "Expected Receipt Date" = field("Date Filter")));
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
        field(50001; "Obsolete"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Obsolete,Impaired';
            OptionMembers = " ","Obsolete","Impaired";
        }
        field(50002; "BGL Product Group Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BGL Product Group".Code where("Item Category Code" = field("Item Category Code"));
        }
    }
    fieldgroups
    {
        addlast(DropDown; Inventory)
        { }
    }
}