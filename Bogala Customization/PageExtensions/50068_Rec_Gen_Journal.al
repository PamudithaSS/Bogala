pageextension 50068 RecGenJournal extends "Recurring General Journal"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}