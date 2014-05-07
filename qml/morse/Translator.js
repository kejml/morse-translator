/***************************************************************************

    Copyright (C) 2012-%YEAR%, Kejml <kejml@kejml.eu>
    All Rights Reserved.

    This file is part of Morse Translator.

    Morse Translator is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Morse Translator is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Morse Translator. If not, see <http://www.gnu.org/licenses/>.

 ***************************************************************************/

.pragma library

Qt.include("storage.js");

var morse=new Array(
"","*","|",".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",
".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--..","-----",".----","..---","...--","....-",
            ".....","-....","--...","---..","----.","-.-.--",".-..-","-.--.-","-.--.-","--..--","-....-",
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
    var cyrillic = getSetting("cyrillic");
    while(bpos<input.length) {
        bpos=input.indexOf("|",apos);
        if(bpos<0) {
            bpos=input.length
        };
        dits=input.substring(apos,bpos);
        apos=bpos+1;letter="";
        for(var j=0;j<morse.length;j++) {
            if(dits==morse[j]) {
                letter = (cyrillic=="true" ? alphabetC.charAt(j) : alphabet.charAt(j) );
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

