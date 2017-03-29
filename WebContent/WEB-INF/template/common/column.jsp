<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div id="dialog2">
			<input type="hidden" value="0" id="hideShareId"/>
			<p class="close"><a href="#" onclick="closeBg();">关闭</a></p>
			<div class="tg-box2" >
				<input type="checkbox" class="otherItem" name="checkItem" value="27" id="i27"/><span class="otherItemSpan" id="s27">集团新闻</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="17" id="i17"/><span class="otherItemSpan" id="s17">企业故事</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="20" id="i20"/><span class="otherItemSpan" id="s20">员工活动</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="29" id="i29"/><span class="otherItemSpan" id="s29">媒体报道</span>
				
			</div>
			<div class="tg-box2" >
				<input type="checkbox" class="otherItem" name="checkItem" value="28" id="i28"/><span class="otherItemSpan" id="s28">行业知识</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="45" id="i45"/><span class="otherItemSpan" id="s45">行业政策</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="55" id="i55"/><span class="otherItemSpan" id="s55">钰诚青年</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="57" id="i57"/><span class="otherItemSpan" id="s57">党建园地</span>
			</div>
			<div class="tg-box2" >
				<input type="checkbox" class="otherItem" name="checkItem" value="64" id="i58"/><span class="otherItemSpan" id="s58">组织建设</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="59" id="i59"/><span class="otherItemSpan" id="s59">规章制度</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="60" id="i60"/><span class="otherItemSpan" id="s60">领导关怀</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="62" id="i62"/><span class="otherItemSpan" id="s62">社会公益</span>
			</div>
			<div class="tg-box2" >
				<input type="checkbox" class="otherItem" name="checkItem" value="63" id="i63"/><span class="otherItemSpan" id="s63">党建荣誉</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="85" id="i85"/><span class="otherItemSpan" id="s85">党员活动</span>
				<input type="checkbox" class="otherItem" name="checkItem" value="89" id="i89"/><span class="otherItemSpan" id="s89">工会动态</span>
			</div>
			<div class="tg-box3" >
				<input class="pass" type="button" onclick="submitOtherItem();" name="" id="" value="确定" />
				<input class="no-pass" type="button" onclick="closeBg();" name="" id="" value="取消" />
			</div>
</div> 