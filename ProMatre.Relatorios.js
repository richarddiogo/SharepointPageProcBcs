document.addEventListener("DOMContentLoaded", function() {
	SP.SOD.executeFunc("sp.js");
	ExecuteOrDelayUntilScriptLoaded(reports.init, "sp.js");
	events(window, document);
	
	//MUDAR...
	$('.dtInit').mask("99/99/9999");
	$('.dtEnd').mask("99/99/9999");
});

var events = (function(window, document, undefined){
	'use strict';
     
    var module = {};  
	var $div = document.getElementById('events');

 	module.input = function($this){
		return {
			dtInit : $this.getElementsByClassName("dtInit")[0].value,
			dtEnd  : $this.getElementsByClassName("dtEnd")[0].value,
			idInit : $this.getElementsByClassName('idInit')[0].attributes[1].value,
			idEnd  : $this.getElementsByClassName('idEnd')[0].attributes[1].value,
			pageCount :$this.getElementsByClassName('PageCount')[0].innerHTML,
			pageCurrent : $this.getElementsByClassName('PageCurrent')[0].innerHTML,
			select : $this.getElementsByClassName("select")//option tipo de relatorio mudar...
		};
	}
	
	module.reset = function($this){
		$this.getElementsByClassName("loading")[0].style.display = 'block';
		$this.getElementsByClassName("PageOptions")[0].style.display = 'none';
		$this.getElementsByClassName("Ficha")[0].innerHTML = "";
	}
	
	$div.addEventListener('click', function(event){
		var $btn = event.target;
		if($btn.id == 'search'){					
			//(DT_INI,DT_FIM,PaginaComando,PrimeiroProdutoID,UltimoProdutoID,PaginaConta,PaginaAtual,QuantidadePorPagina)
			reports.getReports(module.input(this).dtInit,
							   module.input(this).dtEnd,
							   "PRIMEIRO",
							   0,0,0,0,10);
			module.reset(this);				
			//module.input.select tipo de relatorio.					
		}else if($btn.id == 'first'){
			reports.getReports(module.input(this).dtInit,
							   module.input(this).dtEnd,
							   "PRIMEIRO",
							   module.input(this).idInit,
							   module.input(this).idEnd,
							   module.input(this).pageCount,
							   module.input(this).pageCurrent,
							   10);
			module.reset(this);				
		}else if($btn.id == 'last'){
			reports.getReports(module.input(this).dtInit,
							   module.input(this).dtEnd,
							   "ULTIMO",
							   module.input(this).idInit,
							   module.input(this).idEnd,
							   module.input(this).pageCount,
							   module.input(this).pageCurrent,
							   10);
			module.reset(this);				
		}else if($btn.id == 'previous'){
			reports.getReports(module.input(this).dtInit,
							   module.input(this).dtEnd,
							   "ANTERIOR",
							   module.input(this).idInit,
							   module.input(this).idEnd,
							   module.input(this).pageCount,
							   module.input(this).pageCurrent,
							   10);

			module.reset(this);				
		}else if($btn.id == 'next'){
			reports.getReports(module.input(this).dtInit,
							   module.input(this).dtEnd,
							   "PROXIMO",
							   module.input(this).idInit,
							   module.input(this).idEnd,
							   module.input(this).pageCount,
							   module.input(this).pageCurrent,
							   10);
			module.reset(this);				
		}
	});
});

var reports = (function(){
	"use strict";
	var module = {};
	
	var collListItem = "";
    /*var xml = [{
    	vacinadiames:
    
    }];*/
    
	module.init = function() {
		module.getReports('30/01/2015',Settings.Today,'PRIMEIRO',0,0,0,0,10);
	};
	
	module.getReports= function(DT_INI,DT_FIM,PaginaComando,PrimeiroProdutoID,UltimoProdutoID,PaginaConta,PaginaAtual,QuantidadePorPagina) {
		 var clientContext = new SP.ClientContext(_spPageContextInfo.siteAbsoluteUrl);
	     var oList = clientContext.get_web().get_lists().getByTitle('Relatorio_VacinaDiaMesQtde');
	     var select = "&$expand=FieldValuesAsText"; 
	     var camlQuery = new SP.CamlQuery();
	     
	     var xml = '<View Name="{75E20D4C-6741-43A1-8A79-01ED2CF9BC15}" Type="HTML" DisplayName="view" Url="/sites/imunizacao/Lists/Relatorio_VacinaDiaMesQtde/view.aspx" Level="1" BaseViewID="1" ContentTypeID="0x" ImageUrl="/_layouts/15/images/generic.png?rev=39" >\
	    	 	<Method Name="SP_VACINA_DIAMESQTDE_Read_List">\
	    	 	 	<Filter Name="DT_INI" Value="'+DT_INI+'" />\
	    	 	 	<Filter Name="DT_FIM" Value="'+DT_FIM+'" />\
	    	 	 	<Filter Name="PaginaComando" Value="'+PaginaComando+'" />\
	    	 	 	<Filter Name="PrimeiroProdutoID" Value="'+PrimeiroProdutoID+'" />\
	    	 	 	<Filter Name="UltimoProdutoID" Value="'+UltimoProdutoID+'" />\
	    	 	 	<Filter Name="PaginaConta" Value="'+PaginaConta +'" />\
	    	 	 	<Filter Name="PaginaAtual" Value="'+PaginaAtual+'" />\
	    	 	 	<Filter Name="QuantidadePorPagina" Value="'+QuantidadePorPagina+'" />\
	 			</Method>\
				<Query/>\
					<ViewFields>\
						<FieldRef Name="id"/>\
						<FieldRef Name="DATA_ATENDIMENTO"/>\
						<FieldRef Name="ID_ATENDIMENTO"/>\
						<FieldRef Name="APLICADO"/>\
						<FieldRef Name="VALOR"/>\
						<FieldRef Name="ID_ATENDVACINA"/>\
						<FieldRef Name="NOME"/>\
						<FieldRef Name="ID_VACINA"/>\
						<FieldRef Name="PaginaConta"/>\
						<FieldRef Name="PaginaAtual"/>\
					</ViewFields>\
					<RowLimit Paged="TRUE">30</RowLimit>\
					<JSLink>clienttemplates.js</JSLink>\
					<XslLink Default="TRUE">main.xsl</XslLink>\
					<Toolbar Type="Standard"/>\
				</View>';
	    
	    JSRequest.EnsureSetup();
		camlQuery.set_viewXml(xml);
	    collListItem = oList.getItems(camlQuery);
	    clientContext.load(collListItem);     
	    clientContext.executeQueryAsync(Function.createDelegate(this, module.onQuerySucceeded), Function.createDelegate(this, module.onQueryFailed)); 

	};
	
	module.onQuerySucceeded = function(sender, args){
		var listItemEnumerator = collListItem.getEnumerator();  
        var table ='<tr>\
				  <td>Produto</td>\
				  <td>Qtde</td>\
				  <td>Valor</td>\
				  <td>Qtde</td>\
				  <td>Valor</td>\
				</tr>';

		var idInit = 0,idEnd = 0,PageCount = 0,PageCurrent = 0,count = 1,anterior = 0,firstValue = 0,umavez = true; 	    
    	var QtdeUnidade = 0,SomaUnidade = 0,QtdeTotal = 0,somaTotal = 0;
    	var vacinaObj = [];

    	while (listItemEnumerator.moveNext()) {
    	    var oListItem = listItemEnumerator.get_current();
    	   
    	   if(idEnd < oListItem.get_item("ID_ATENDVACINA")){   	
			 	idEnd = oListItem.get_item("ID_ATENDVACINA");
			 	
			 	if(umavez){
			 		idInit = oListItem.get_item("ID_ATENDVACINA");
					umavez = false;
				}
			}
			 	
    	    if(idInit > oListItem.get_item("ID_ATENDVACINA")) 
    	   		idInit = oListItem.get_item("ID_ATENDVACINA");
   			
    	 	 	
	    	if(oListItem.get_item("ID_VACINA") == anterior){ 
	    	     firstValue = module.StringForCurrencyOrNumber(firstValue) + module.StringForCurrencyOrNumber(oListItem.get_item("VALOR"));  
	    	     var ok = true;
	    	     
	    	     if(vacinaObj.length == 0){
	    	     	vacinaObj.push({'id':anterior,'valor':firstValue,'count':1})
	    	     }
	    	     
	    	     for(var i =0; vacinaObj.length > i;i++){
	    	     	if(vacinaObj[i].id == anterior){
	    	     		vacinaObj[i].valor = firstValue;
	    	     		vacinaObj[i].count = vacinaObj[i].count+1;
	    	     		ok = false;
	    	     	}
	    	     }   
	    	     
	    	     if(ok){
	    	     	vacinaObj.push({'id':anterior,'valor':firstValue,'count':2});
	    	     }
 	    	    	    
	    	}else{
	    	
				table +='<tr>\
						  <td>'+oListItem.get_item("NOME")+'</td>\
						  <td>'+oListItem.get_item("DATA_ATENDIMENTO")/*QTDE unidade*/+'</td>\
						  <td>'+oListItem.get_item("ID_ATENDIMENTO")/*VALOR unidade*/+'</td>\
						  <td data-Qtde="'+oListItem.get_item("ID_VACINA")/*QtdeTotal*/+'"></td>\
						  <td data-valor="'+oListItem.get_item("ID_VACINA")/*valorTotal*/+'"></td>\
						</tr>';
				
				QtdeUnidade += module.StringForCurrencyOrNumber(oListItem.get_item("DATA_ATENDIMENTO"));
				SomaUnidade += module.StringForCurrencyOrNumber(oListItem.get_item("ID_ATENDIMENTO"));
				firstValue = oListItem.get_item("VALOR");	
				anterior = oListItem.get_item("ID_VACINA");
				
				if(collListItem.get_count() == count ){
					vacinaObj.push({'id':anterior,'valor':module.StringForCurrencyOrNumber(firstValue),'count':1});
				}
			}
			
			PageCount = oListItem.get_item("PaginaConta");
			PageCurrent = oListItem.get_item("PaginaAtual");
			
			count++;
        }
         table +='<tr>\
				  <td>Total</td>\
				  <td data-soma="QtdeUnidade"></td>\
				  <td data-soma="SomaUnidade"></td>\
				  <td data-soma="QtdeTotal"></td>\
				  <td data-soma="somaTotal"></td>\
				</tr>';

        // MUDAR ...
        $(".loading").hide();       
        $(".PageCurrent").html(PageCurrent);
        $(".PageCount").html(PageCount);
        
        $(".Ficha").html(table);
        
        $(".PageOptions").show();
        
        var max = vacinaObj.length;
        
       	while(max--){
       		$('[data-qtde="'+vacinaObj[max].id+'"]').html(vacinaObj[max].count);
       		$('[data-valor="'+vacinaObj[max].id+'"]').html(module.CurrencyForString(vacinaObj[max].valor));
       		QtdeTotal += module.StringForCurrencyOrNumber(vacinaObj[max].count);
       		somaTotal += module.StringForCurrencyOrNumber(vacinaObj[max].valor);
        } 
        
       	$('[data-soma="QtdeUnidade"]').html(QtdeUnidade);
       	$('[data-soma="SomaUnidade"]').html(module.CurrencyForString(SomaUnidade));
       	$('[data-soma="QtdeTotal"]').html(QtdeTotal);
       	$('[data-soma="somaTotal"]').html(module.CurrencyForString(somaTotal));
        $('.idInit').attr('data-idInit',idInit);
        $('.idEnd').attr('data-idEnd',idEnd);
		$('.dtInit').val('30/01/2015');
		$('.dtEnd').val(Settings.Today);
		
		if(PageCurrent == 1){
			$('#previous , #first').hide();
			$('.toglee').show();
			$('#next, #last').show();
			$('.togleeEnd').hide();
		}else{
			$('#previous , #first').show();
			$('.toglee').hide();
			$('#next, #last').show();
			$('.togleeEnd').hide();
		}
		
		if(PageCount == PageCurrent){
			$('#next, #last').hide();
			$('.togleeEnd').show();
		}
		
			
	};
	
	module.onQueryFailed = function(sender, args){
		alert('Request failed. ' + args.get_message() + '\n' + args.get_stackTrace());
	
	};

	module.StringForCurrencyOrNumber = function(numero){
		return	numero = parseFloat(numero.toString().replace(',','.'));
	}
	
	module.CurrencyForString = function(numero){
		return	numero = numero.toFixed(2).toString().replace('.',',');
	}
	
	return {
		init : module.init,
		getReports : module.getReports
	};
}());
