reportextension 50010 InventoryAvailability extends "Inventory Availability"
{
    dataset
    {
        add(Item)
        {
            column(Inventory_Item; Item.Inventory)
            { }
            column(DateFilter_Item; DateFilter)
            { }
        }
    }
    trigger OnPreReport()
    begin
        DateFilter := Item.GETFILTER("Date Filter");
    end;

    var
        DateFilter: Text[100];
}