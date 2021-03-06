<#-- 引入布局指令的命名空间 -->
<#import "../layout/defaultLayout.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.head bgcolour="bg-yellow">
<meta name="keywords" content="任霏,网站,博客,互联网,IT,技术,软件,应用,开发,建站"/>
<meta name="description" content="任霏个人博客，是一个关注分享关于互联网、IT技术、软件应用、程序开发等计算机科技领域的IT科技独立博客站点，作者任霏（NeilRen）免费为软件开发者提供帮助与支持。"/>
<title>搜索 ${wd} - NEILREN.COM - 关注分享互联网、IT技术、软件应用等计算机科技领域的IT科技博客</title>
<style>
    em {
        color: red;
        font-weight: 800;
    }
</style>
</@defaultLayout.head>

<@defaultLayout.header>
</@defaultLayout.header>

<main id="awd-site-main">
    <section id="awd-site-content">
        <div class="sections-block">
            <div class="slides">

                <div class="slides-wrap">
                    <div class="slide-item" data-slide-id="home">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide-content">
                                        <div class="row">
                                            <div class="col-lg-8 col-md-7 svm">
                                                <div class="row" style="margin: 0;padding: 0;">
                                                    <form class="subscribe-form" style="margin: 0;padding: 0;"
                                                          method="get" action="/Search/">
                                                        <div class="col-md-10" style="padding: 0;margin: 0;">
                                                            <input type="text" id="subscribe-email"
                                                                   name="wd"
                                                                   placeholder="<#if wd??>${wd?html}<#else >搜索一下</#if>"
                                                                   style="padding: 5px 20px;">
                                                        </div>
                                                        <div class="col-md-2" style="padding: 0;margin: 0;">
                                                            <button type="submit" class="btn" style="width: 100%">
                                                                <span>搜索</span> <i class="fa fa-search"></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="row"
                                                     style="margin: 0;padding: 0;font-size: 12px;text-align: left;">
                                                <#if searchResults??>
                                                    共找到${searchResults.getTotal()}个结果，用时${searchResults.getSearchtime()}秒。
                                                </#if>
                                                </div>
                                                <div class="section-info text-left">
                                                    <div class="countdown">
                                                        <div class="animated" data-animation="fadeIn"
                                                             data-animation-delay="60">
                                                        <#if searchResults??>
                                                            <#list resultsItems as resultsItem>
                                                                <div class="entry-content">
                                                                    <a href="/Article/${resultsItem.getId()}">
                                                                        <h3 class="text-default animated"
                                                                            data-animation="fadeIn"
                                                                            data-animation-delay="50">
                                                                        ${resultsItem.getTitle()}
                                                                        </h3>
                                                                    </a>
                                                                    <div class="row entry-info">
                                                                        <div class="col-xs-6">
                                                                            <span class="entry-date">${resultsItem.getTimestamp()?date}</span>
                                                                            <span class="entry-byline">Views:${resultsItem.getPageview()}</span>
                                                                        </div>
                                                                    </div>
                                                                    <p class="animated" data-animation="fadeIn"
                                                                       data-animation-delay="100">
                                                                    ${resultsItem.getContent()}
                                                                    </p>
                                                                </div>
                                                            </#list>
                                                        </#if>
                                                        </div>
                                                    </div>
                                                </div>
                                            <#if articlePagingList??>
                                                <div>
                                                    <#list articlePagingList as articlePaging>
                                                        <a href="/Search/?wd=${wd}&page=${articlePaging.getIndex()!""}"
                                                           class="btn <#if articlePaging.getIndex()==Index>btn-inverse</#if> animated"
                                                           data-animation-delay="60" style="margin-bottom: 5px;">
                                                        ${articlePaging.getName()!""}
                                                        </a>
                                                    </#list>
                                                </div>
                                            </#if>
                                            </div>
                                            <div class="col-lg-4 col-md-5 svm" style="vertical-align: top;">
                                                <div class="section-info text-left">

                                                <#if tagList??>
                                                    <h2 class="text-default animated" data-animation="fadeIn"
                                                        data-animation-delay="50">
                                                        Popular Tags
                                                    </h2>
                                                    <#list tagList as tag>
                                                        <a href="/tag/${tag.getEnName()!""}" class="btn animated"
                                                           data-animation-delay="60" style="margin-bottom: 5px;">
                                                        ${tag.getZhName()!""}
                                                        </a>
                                                    </#list>
                                                </#if>

                                                <#if articleTop10ByDateList??>
                                                    <h2 class="text-default animated" data-animation="fadeIn"
                                                        data-animation-delay="50">
                                                        Most Recent
                                                    </h2>
                                                    <#list articleTop10ByDateList as articleTop10ByDate>
                                                        <a href="/Article/${articleTop10ByDate.getId()?c}"
                                                           class="animated" data-animation-delay="60"
                                                           style="display:block;margin-bottom: 5px;font-size: 14px">
                                                            <#if articleTop10ByDate.getTitle()?length gt 28>
                                                            ${articleTop10ByDate.getTitle()?substring(0,28)?html}...
                                                            <#else>
                                                            ${articleTop10ByDate.getTitle()!""}
                                                            </#if>
                                                        </a>
                                                    </#list>
                                                </#if>

                                                <#if articleTop10ByViewsList??>
                                                    <h2 class="text-default animated" data-animation="fadeIn"
                                                        data-animation-delay="50">
                                                        Top Views
                                                    </h2>
                                                    <#list articleTop10ByViewsList as articleTop10ByViews>
                                                        <a href="/Article/${articleTop10ByViews.getId()?c}"
                                                           class="animated" data-animation-delay="60"
                                                           style="display:block;margin-bottom: 5px;font-size: 14px">
                                                            <#if articleTop10ByViews.getTitle()?length gt 28>
                                                            ${articleTop10ByViews.getTitle()?substring(0,28)?html}...
                                                            <#else>
                                                            ${articleTop10ByViews.getTitle()!""}
                                                            </#if>
                                                        </a>
                                                    </#list>
                                                </#if>

                                                <#if archivesList??>
                                                    <h2 class="text-default animated" data-animation="fadeIn"
                                                        data-animation-delay="50">
                                                        Archives
                                                    </h2>
                                                    <#list archivesList as archives>
                                                        <a href="/Archives/${archives.getDateYmd()}" class="animated"
                                                           data-animation-delay="60"
                                                           style="display:block;margin-bottom: 5px;">
                                                        ${archives.getDateYmd()!""}（${archives.getNumber()!""}）
                                                        </a>
                                                    </#list>
                                                </#if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>


<@defaultLayout.footer>
<script type="text/javascript" src="//cdn.neilren.com/neilren4j/1.0.0/js/jquery.raty.min.js"></script>
<script>
    $(function () {

        $.fn.raty.defaults.path = '//cdn.neilren.com/neilren4j/1.0.0/img';

        $('.score-callback').raty({

            score: function () {

                return $(this).attr('data-score');

            },
            click: function (score, evt) {
                $.ajax({
                    type: "POST",
                    url: "/Article/Grade",
                    data: {
                        longId: $(this).attr('data-id'), grade: score
                    }
                });
            }

        });

    });
</script>
</@defaultLayout.footer>