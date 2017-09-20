/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'about', groups: [ 'about' ] },
		'/',
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] }
	];

	config.removeButtons = 'Print,Preview,NewPage,Save,Templates,Flash,Anchor,BidiLtr,BidiRtl,Iframe,Cut,Copy,Paste,PasteText,PasteFromWord,SelectAll,Scayt,Maximize,ShowBlocks,Strike,Underline,Subscript,Superscript,RemoveFormat,CopyFormatting,Find,Replace,Form,Checkbox,Radio,TextField,Textarea,Select,ImageButton,HiddenField,Smiley,Language,Indent,Outdent,CreateDiv,Button,PageBreak';
};