reportextension 50012 ItemAgeCompositionQty extends "Item Age Composition - Qty."
{
    dataset
    {
        add(Item)
        {
            column(Description__ItemCategory; ItemCategory.Description)
            { }
        }
        modify(Item)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Clear(ItemCategory);
                IF ItemCategory.GET("Item Category Code") THEN;
            end;
        }
    }
    var
        ItemCategory: Record "Item Category";
}