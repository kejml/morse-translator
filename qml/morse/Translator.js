.pragma library

Qt.include("storage.js");

var morse=new Array(
"","*","|",".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",
".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--..","-----",".----","..---","...--","....-",
            ".....","-....","--...","---..","----.","--..--",".-..-","-.--.-","-.--.-","--..--","-....-",
            ".-.-.-","-..-.","---...","-.-.-.","-....-","..--..",".--.-.","---.","..-..","..--",".-.-","----"
);
var alphabet=' *|ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!"(),-./:;=?@ÖËÜÄ*';
var alphabetC=' *|АБЦДЕФГХИЙКЛМНОПЩРСТУЖВЬЫЗ0123456789!"(),-./:;=?@ЧЭЮЯШ';

function text2morse(input) {
    var output="";
    var found=false;
    for(var i=0;i<input.length;i++) {
        var letter=input.charAt(i).toUpperCase();
        for(var j=0;j<morse.length;j++){
            if(letter==alphabet.charAt(j)){
                output+=morse[j];
                found=true;
            }
        };
        if (!found) {
            for(var j=0;j<morse.length;j++){
                if(letter==alphabetC.charAt(j)){
                    output+=morse[j];
                    found=true;
                }
            };

        }
        if (!found) {
            output += "<span class=\"notFound\">*</span>"
        }
        found=false;

        output+="|";
    };
    output=output.substring(0,output.length-1);
    return output;
};

function morse2text(input) {
    var output="";
    var apos=0;
    var bpos=0;
    var letter;
    var dits;
    var cyrilic = getSetting("cyrilic");
    while(bpos<input.length) {
        bpos=input.indexOf("|",apos);
        if(bpos<0) {
            bpos=input.length
        };
        dits=input.substring(apos,bpos);
        apos=bpos+1;letter="";
        for(var j=0;j<morse.length;j++) {
            if(dits==morse[j]) {
                letter = (cyrilic=="true" ? alphabetC.charAt(j) : alphabet.charAt(j) );
            }
        };
        if(letter==""){letter="*"};
        output+=letter;
    };
    return output;
}

function morse2allTexts(input) {
    var output = "";
    output+=morse2text(input)+"\n";     // . - |

    var tmp = input.replace(/\./g,"*");
    tmp = tmp.replace(/\-/g,".");
    tmp = tmp.replace(/\*/g,"-");

    output+=morse2text(tmp)+"\n";       // - . |

    tmp = tmp.replace(/\./g,"*");
    tmp = tmp.replace(/\|/g,".");
    tmp = tmp.replace(/\*/g,"|");

    output+=morse2text(tmp)+"\n";       // - | .

    tmp = tmp.replace(/\./g,"*");
    tmp = tmp.replace(/\-/g,".");
    tmp = tmp.replace(/\*/g,"-");

    output+=morse2text(tmp)+"\n";       // . | -

    tmp = tmp.replace(/\./g,"*");
    tmp = tmp.replace(/\|/g,".");
    tmp = tmp.replace(/\*/g,"|");

    output+=morse2text(tmp)+"\n";       // | . -

    tmp = tmp.replace(/\./g,"*");
    tmp = tmp.replace(/\-/g,".");
    tmp = tmp.replace(/\*/g,"-");

    output+=morse2text(tmp)+"\n";       // | - .

    return output

}

