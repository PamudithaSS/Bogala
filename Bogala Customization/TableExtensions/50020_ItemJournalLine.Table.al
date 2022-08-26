tableextension 50020 ItemJournalLine extends "Item Journal Line"
{
    fields
    {
        field(50010; "Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; Inventory; Decimal)
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No.")));

        }
        modify("Item No.")
        {
            trigger OnAfterValidate()
            var
                item: Record Item;
            begin
                if item.Get("Item No.") then;
                item.CalcFields(Inventory);
                Inventory := item.Inventory;
            end;
        }
    }
}