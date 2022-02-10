function OnLinkClick(){
	let divTag = document.getElementById('request_url');
	let range = document.createRange();
	range.selectNodeContents(divTag);
	let selection = document.getSelection();
	selection.removeAllRanges();
	selection.addRange(range);
    document.execCommand('copy');
 	alert('copied this site URL to clipboard.');
	selection.removeAllRanges();
};

function OnLinkClick2(){
  let divTag = document.getElementById('request_url');
  let sUrl=divTag.textContent;
  navigator.clipboard.writeText(sUrl);
  alert('copied this site URL to clipboard.');
};
