/**
 * Created by user on 2017/5/3.
 */
var editor = null;
window.onload = function() {
    editor = CKEDITOR.replace( 'content', {
        customConfig:'${contextPath}/ckeditor4.6/myconfig.js',
        on: {
            instanceReady: function( ev ) {
                this.dataProcessor.writer.setRules( 'p', {
                    indent: false,
                    breakBeforeOpen: false,   //<p>之前不加换行
                    breakAfterOpen: false,    //<p>之后不加换行
                    breakBeforeClose: false,  //</p>之前不加换行
                    breakAfterClose: false    //</p>之后不加换行7
                });
            }
        }
    });
};
