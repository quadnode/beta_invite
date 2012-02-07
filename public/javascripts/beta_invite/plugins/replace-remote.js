/**
 *
 * @author: arnab
 * Date: 12/4/11
 */
(function($) {

    // jquery plugin works like load, but instead it fetches the remote data
    // and then replaces existing element with the new one
    $.fn.replaceRemote = function( url, params, callback ) {
      var me = this;
      
      if($.browser.msie){
        $.get(url, function(data) {
          $(me).replaceWith($(innerShiv(data, false)));
        });
        
      }else{
        var dummyContainer = document.createElement( 'div' );
        // load the content in the dummy container and then later insert the content in the specified
        // location
        $( dummyContainer ).load( url, function ( data, status, xhr ) {
            //$(me).replaceWith($(innerShiv(data, false)));
            $( me ).replaceWith( $(dummyContainer).children() );

            if( $.isFunction( callback ) ) {
                callback( data, status, xhr );
            }
        } );
      }
    };
})(jQuery);
