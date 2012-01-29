var http_request = false;

function macheRequest(url, id)
{
	http_request = false;
	if (window.XMLHttpRequest)
	{
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType)
		{
			http_request.overrideMimeType('text/xml');
		}
	}
	else if (window.ActiveXObject)
	{
		try
		{
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			try
			{
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e)
			{
			}
		}
	}

	if (!http_request)
	{
		alert('无法创建http_request，请检查浏览器设置');
		return false;
	}
	http_request.onreadystatechange = function()
	{
		alertInhalt2(id);
	};
	http_request.open('GET', url, true);
	http_request.send(null);
}

function alertInhalt2(id)
{
	if (http_request.readyState == 4)
	{
		if (http_request.status == 200)
		{
			myElement = document.getElementById(id);
			if (myElement != null)
			{
				myElement.innerHTML = http_request.responseText;
			}
		}
		else
		{
			alert('http_request.status出现异常');
		}
	}
}