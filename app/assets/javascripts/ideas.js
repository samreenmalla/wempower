// alert("hello!!");
function showText() {
    alert("hello!!");
    var wurd = data.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '').split(" ");
    
    var oInput2;
    var output = ''
    console.log(wurd);

    fetch('https://raw.githubusercontent.com/web-mech/badwords/master/lib/lang.json')
        .then(res => {
            return res.json();
        })
        .then(json => {
            for (let i = 0; i < wurd.length; i++) {

                for (let j = 0; j < json.words.length; j++) {
                    if (wurd[i] === json.words[j]) {


                        oInput2 = wurd[i].replace(json.words[j], function (sMatch) {
                            return sMatch.replace(/./g, "*");

                        });
                        console.log(oInput2);
                        break;
                    }
                    else {
                        oInput2 = wurd[i]
                        console.log(oInput2)
                    }
                }
                output += oInput2 + ' '
            }
            console.log(output)

        })

}
    
