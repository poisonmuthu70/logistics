require 'active_support'
require 'active_support/all'
#require 'rest-client'

module AdminHelper
	   include JqgridsHelper
  def employee_jqgrid
    options = {:on_document_ready => true, :html_tags => false}
    grid = [{
      :url => '/index',
      :datatype => 'json',
      :mtype => 'GET',
      :colNames => [  'ID','Source', 'Destination', 'Delivery id'],
      :colModel  => [
        { :name => 'id',   :index => 'id',    :width => 100,:align => 'left'},
        { :name => 'source',   :index => 'source',    :width => 200,:align => 'left', :editable => true},
        { :name => 'destination', :index => 'destination',  :width => 200 ,:align => 'left', :editable => true},
        { :name => 'delivery_id', :index => 'delivery_id',  :width => 200 ,:align => 'left', :editable => true}
      ],
      :editurl => '/employees/update',
      :pager => '#invoices_pager',
      :rowNum => 10,
      :rowList => [10, 20, 30],
      :sortname => 'name',
      :sortorder => 'desc',
      :viewrecords => true,
      :caption => 'Employee List',
      :onSelectRow => "function() { alert('Row selected!');}".to_json
    }]


    pager = [:navGrid, "#invoices_pager", {:del => true}, {:closeAfterEdit => true, :closeOnEscape => true}, {}, {}, {}, {}]

    pager_button = [:navButtonAdd, "#invoices_pager", {:caption => 'Add', :onClickButton => 'function() {alert("Custom button!")}'.to_json }]

    jqgrid_api 'invoices_list', grid, pager, pager_button, options

  end
end
