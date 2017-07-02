/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	 config.language = 'zh-cn';
	 config.uiColor = '#AADC6E';

    //其他一些配置
    filebrowserBrowseUrl = '/ckfinder2.3.1/ckfinder.html';
    filebrowserImageBrowseUrl = '/ckfinder2.3.1/ckfinder.html?type=Images';
    filebrowserFlashBrowseUrl = '/ckfinder2.3.1/ckfinder.html?type=Flash';
    filebrowserUploadUrl = '/ckfinder2.3.1/core/connector/java/connector.java?command=QuickUpload&type=Files';
    filebrowserImageUploadUrl = '/ckfinder2.3.1/core/connector/java/connector.java?command=QuickUpload&type=Images';
    filebrowserFlashUploadUrl = '/ckfinder2.3.1/core/connector/java/connector.java?command=QuickUpload&type=Flash';
};
