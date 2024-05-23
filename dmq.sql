--------------------------------------------------------
-- Collections
--------------------------------------------------------
-- get all Collections names and IDs to populate the Collections page
select collection_id, collection_name from Collections

-- adds a new collection based on submission of the Add Collection form
insert into Collections (collection_id, collection_name)
values (:collection_idInput, :collection_nameInput)

-- get all Collection IDs to populate Edit Collections dropdown
select collection_id from Collections

-- update a collection's data based on submission of the Edit Collection form 
update Collections set collection_id = :collection_id_from_dropdown_Input, collection_name = :collection_nameInput WHERE collection_id = :collection_id_from_the_edit_form

-- delete a collection from the Collections page and its associated sets on the Sets page
delete from Collections
    where collection_id = :collection_id_selected_from_collections_page



--------------------------------------------------------
-- Sets 
-------------------------------------------------------
-- get all sets and their collection name to populate the Sets page 
select Sets.id, Sets.set_name, Sets.set_release, Sets.set_min_age, Sets.set_min_age, Sets.set_retired, Sets.set_price, Collections.collection_name as collection_name
        from Sets   
            inner join Collections
            on Sets.collection_id = Collections.collection_id

-- search bar: return the set corresponding to the set name entered 
select 


-- get all Collection Names to populate Add Set form dropdown 
select collection_name from Collections 

-- adds a new set based on submission of the Add Set form 
insert into Sets (set_id, set_name, set_release, set_min_age, set_retired, set_price, collection_name)
values (:set_id_from_dropdown_Input, :set_nameInput, :set_release_Input, :set_min_ageInput, :set_retiredInput, :set_priceInput, :collection_name_from_dropdown_Input)

-- get all Sets Ids to populate Edit Set form dropdwon
select set_id from Sets

-- get all Collection Names to populate Edit Set form dropdown 
select collection_name from Collections

-- update a set's data based on submission of the Edit Set form
update Sets set set_id = :set_id_from_dropdown_Input, set_name = :set_nameInput, set_release = :set_release_Input, set_min_age = :set_min_ageInput, set_retired = :set_retiredInput, set_price = :set_priceInput, collection_name = :collection_name_from_dropdown_Input

-- delete a set
delete from Sets where set_id = :set_id_selected_from_sets_page



--------------------------------------------------------
-- Pieces
---------------------------------------------------------
-- get all Pieces IDs, colors, names, and prices to populate the Pieces
select piece_id, piece_color, piece_name, piece_price from Pieces

-- adds a new piece based on submission of the Add Piece form 
insert into Pieces (piece_id, piece_color, piece_name, piece_price)
values (:piece_idInput, :piece_colorInput, :piece_nameInput, :piece_priceInput)

-- get all Piece IDs to populate dropdown for Edit Piece form 
select piece_id from Pieces

-- update a piece's data based on submission of the Edit Piece form 
update Pieces set piece_id = :piece_idInput, piece_color = :piece_colorInput, piece_name = :piece_nameInput, piece_price = :piece_priceInput

-- delete a piece
delete from Pieces where piece_id = :piece_id_selected_from_pieces_page



--------------------------------------------------------
-- Customers
--------------------------------------------------------
-- get all Customers IDs and locations to populate the Customers page
select customer_id, customer_location from Customers

-- adds a new customer based on submission of the Add Customer form
insert into Customers (customer_id, customer_location)
values(:customer_idInput, :customer_locationInput)

-- select all customer IDs to populate Edit Customer form dropdown 
select customer_id from Customers 

-- update a customer's data based on submission of the Edit Customer form
update Customers set customer_id = :customer_id_from_dropdown_Input, customer_location = customer_locationInput

-- delete a customer
delete from Customers where customer_id = :customer_id_selected_from_customers_page



--------------------------------------------------------
-- Sets Has Pieces
--------------------------------------------------------
-- get all Set IDs and Piece IDs to populate the Sets Has Pieces Page 
select sets_set_id, pieces_piece_id from Sets_has_Pieces 

-- adds new set-piece data based on submission of the Add Sets Has Pieces Relationship form 
insert into Sets_has_Pieces (sets_set_id, pieces_piece_id)
values(:sets_set_idInput, :pieces_piece_idInput)

-- deletes a set-customer relationship
delete from Sets_has_Pieces where sets_set_id = :sets_set_id_selected_from_sets_has_pieces_page



--------------------------------------------------------
-- Sets Has Customers 
--------------------------------------------------------
-- get all customer IDs and set IDs to populate the Sets Has Pieces Page 
select sets_set_id, customers_customer_id from Sets_has_Customers

-- adds new set-customer data based on submission of the Add Sets Has Customers Relationship form 
insert into Sets_has_Customers (sets_set_id, customers_customer_id)
values(:sets_set_idInput, :customers__customer_idInput)

-- deletes a set-customer relationship
delete from Sets_has_Customers where sets_set_id= :sets_set_id_selected_from_sets_has_customers_page
