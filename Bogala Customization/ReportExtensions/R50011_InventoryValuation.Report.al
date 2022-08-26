reportextension 50011 InventoryValuation extends "Inventory Valuation"
{
    dataset
    {
        add(Item)
        {
            column(Item_Obsolete; Item.Obsolete)
            { }
            column(ItemCategoryDescription; ItemCategory.Description)
            { }
        }
        modify(Item)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if not ItemCategory.Get(Item."Item Category Code") then
                    Clear(ItemCategory);
            end;
        }
    }

    var
        ItemCategory: Record "Item Category";
}