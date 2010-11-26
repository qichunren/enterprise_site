/**
 * @author Ralph Voigt (info -at- drakedata.com)
 * @version 1.0
 * @date 15.12.2009
 *
 * @name serializeList
 * @type jQuery
 * @homepage http://plugins.jquery.com/project/serializeList/
 * @desc Recursive function to serialize ordered or unordered lists of arbitrary depth and complexity. The resulting array will keep the order of the list and is suitable to be posted away.
 * @example $("#mylist").serializeList("id","myArray")
 * @param String attribute The attribute of the li-elements to be serialised
 * @param String levelString The Array to store data in
 * @return String The array to be sent to the server via post
 *          Boolean false if the passed variable is not a list or empty
 * @cat Plugin
 */
 
jQuery.fn.serializeList = function (attribute, levelString) {
	var dataString = "";
	this.children().each(function() {
		var curLi = $(this);
		if( curLi.find('ul').length > 0) {
			levelString += '['+curLi.attr(attribute)+']';
			var toAdd = $('ul:first', curLi).serializeList(attribute, levelString);
			if(toAdd) dataString += toAdd;
			levelString = levelString.replace(/\[[^\]\[]*\]$/, "");
		} else if( curLi.find('ol').length > 0) {
			levelString += '['+curLi.attr(attribute)+']';
			dataString += $('ol:first', curLi).serializeList(attribute, levelString);
			levelString = levelString.replace(/\[[^\]\[]*\]$/, "");
		} else {
			dataString += "&"+levelString+"[]="+curLi.attr(attribute);
		}
	});
	if(dataString) return dataString;
	else return false;
};


jQuery(document).ready(function(){ 
  
  // for nav menu sort 
  jQuery("#enable_navmenu_list_sortable").click(function(){
    jQuery(this).hide();
    jQuery("#done_navmenu_list_sortable").show();
    jQuery("#navmenu_list_sortable").css({ border: "1px solid #BDBDBD", padding: "2px"}).sortable({ axis: 'x' })
  });
                       
  // save nav menu sort at server side
  jQuery("#done_navmenu_list_sortable").click(function(){
    jQuery.post("/syspanel/navmenus/sort?" + $("#navmenu_list_sortable").serializeList("data-id","navmenus"));
    jQuery(this).hide();
    jQuery("#enable_navmenu_list_sortable").show();
    jQuery("#navmenu_list_sortable").css({ border: "0px solid #BDBDBD", padding: "0px"}).sortable("disable");
  });   
  
  jQuery('.wymeditor').wymeditor({ 
    updateSelector: "input[type='submit']"
  });
  

});