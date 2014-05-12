// Alexander Soto
// Syntax hghlighting for a subset of the mips assembly language

SyntaxHighlighter.brushes.MipsAsm = function() {
    
    var keywords = "li mtc0 lw mfc0 srl lui sw addi beq and";

	this.regexList = [
		{ regex: SyntaxHighlighter.regexLib.singleLinePerlComments,        
			css: 'comments' },              // one line comments
		{ regex: /[a-zA-Z0-9]*:/g,                                          
			css: 'function'},
        { regex: /\.[^ ]*/g,                                          
			css: 'function'},
		{ regex: /\b([\d]+(\.[\d]+)?|0x[a-fA-F0-9]+)\b/gi,              
			css: 'value' },                 // numbers
		{ regex: new RegExp(this.getKeywords(keywords), 'gm'),          
			css: 'keyword' }               // keywords
	];

	this.forHtmlScript({
		left    : /(&lt;|<)%[@!=]?/g,
		right   : /%(&gt;|>)/g
	});
};

SyntaxHighlighter.brushes.MipsAsm.prototype= new SyntaxHighlighter.Highlighter();
SyntaxHighlighter.brushes.MipsAsm.aliases = ['asm'];
