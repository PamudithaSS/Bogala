query 50000 "Inv-reorder"
{
    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            { }
            column(Description; Description)
            { }
            column(BaseUoM; "Base Unit of Measure")
            { }
            column(InventoryPostGroup; "Inventory Posting Group")
            { }
            column(ReorderPolicy; "Reordering Policy")
            { }
            column(ReorderPoint; "Reorder Point")
            { }
            column(SafeStockQty; "Safety Stock Quantity")
            { }
            column(ReorderQty; "Reorder Quantity")
            { }
            column(MaxInventory; "Maximum Inventory")
            { }
            column(MinOrdQty; "Minimum Order Quantity")
            { }
        }
    }
}

