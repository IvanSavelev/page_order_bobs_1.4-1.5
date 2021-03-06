<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-12 pos-12">
                    <ul class="breadcrumb">
                        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
                        <?php if($i+1<count($breadcrumbs)) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php } else { ?>
                        <li class="active"><?php echo $breadcrumb['text']; ?></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
            </div>
            <?php echo $content_top; ?>
            <div class="row">
                <div class="col-sm-12 pos-9">
                    <h1><?php echo $heading_title; ?></h1>
                    <br/>

                    <!-- BEGIN ORDER -->
                    <?php if(isset($order)) { ?>
                    <table class="list-cart">
                        <colgroup>
                            <col class="image">
                            <col class="name">
                            <col class="model">
                            <col class="quantity">
                            <col class="price">
                            <col class="total">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="image"><?php echo $column_image; ?></th>
                            <th class="name"><?php echo $column_name; ?></th>
                            <th class="model"><?php echo $column_model; ?></th>
                            <th class="quantity"><?php echo $column_quantity; ?></th>
                            <th class="price"><?php echo $column_price; ?></th>
                            <th class="total"><?php echo $column_total; ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($products as $product) { ?>
                        <?php if (!empty($product['recurring'])) { ?>
                        <tr>
                            <td class="simplecheckout-recurring-product" style="border:none;"><img
                                        src="<?php echo $additional_path ?>catalog/view/theme/default/image/reorder.png"
                                        alt="" title="" style="float:left;"/>
                                <span style="float:left;line-height:18px; margin-left:10px;">
                                <strong><?php echo $text_recurring_item ?></strong>
                                    <?php echo $product['profile_description'] ?>
                                </span>
                            </td>
                        </tr>
                        <?php } ?>
                        <tr>
                            <td class="image">
                                <?php if ($product['thumb']) { ?>
                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                               alt="<?php echo $product['name']; ?>"
                                                                               title="<?php echo $product['name']; ?>"/>
                                </a>
                                <?php } ?>
                            </td>
                            <td class="name">
                                <?php if ($product['thumb']) { ?>
                                <div class="image">
                                    <a href="<?php echo $product['href']; ?>"><img
                                                src="<?php echo $product['thumb']; ?>"
                                                alt="<?php echo $product['name']; ?>"
                                                title="<?php echo $product['name']; ?>"/></a>
                                </div>
                                <?php } ?>
                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <div class="options">
                                    <?php foreach ($product['option'] as $option) { ?>
                                    &nbsp;
                                    <small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                                    <br/>
                                    <?php } ?>
                                    <?php if (!empty($product['recurring'])) { ?>
                                    -
                                    <small><?php echo $text_payment_profile ?>
                                        : <?php echo $product['profile_name'] ?></small>
                                    <?php } ?>
                                </div>
                            </td>
                            <td class="model"><?php echo $product['model']; ?></td>
                            <td class="quantity"><?php echo $product['quantity']; ?></td>
                            <td class="price"><?php echo $product['price']; ?></td>
                            <td class="total"><?php echo $product['total']; ?></td>
                        </tr>
                        <?php } ?>
                        <?php if(isset($price_total_mod)) { ?>
                            <?php foreach($price_total_mod as $price_mod) { ?>
                                <tr>
                                    <td class="right" colspan="5">
                                        <?php echo $price_mod['title']; ?>
                                    </td>
                                    <td class="right">
                                        <?php echo $price_mod['text']; ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php } ?>
                        </tbody>
                    </table>
                    <?php } else  { ?>
                    <?php if(isset($description_order)) { ?>
                    <p id="description"><?php echo $description_order; ?></p>
                    <?php } ?>
                    <?php } ?>

                    <?php if($notes!='' && $notes_up_position) { ?>
                        <TABLE>
                            <tr>
                                <td style="width: 100px;"><? echo $notes_label; ?></td>
                                <td><? echo $notes; ?></td>
                            </tr>
                        </TABLE>
                    <?php } ?>

                    <!-- END ORDER -->
                    <?php switch($type_of_presentation) {
                    case 0: ?>
                            <h3><?php echo $list_payment_label; ?></h3>
                            <ul>
                                <?php if(!empty($alter_payment_check)) { ?>
                                <li><?php echo $alter_payment_text; ?></a></li>
                                <?php } ?>
                                <?php if(!empty($pay2pay_check)) { ?>
                                <li><a id="link_pay2pay" target="_blank" href="<?php echo $link_pay2pay; ?>">
                                        <?php echo $link_pay2pay_label; ?></a></li>
                                <?php } ?>
                                <?php if(!empty($robokassa_check)) { ?>
                                <li><a id="link_robokassa" target="_blank" href="<?php echo $link_robokassa; ?>">
                                        <?php echo $link_robokassa_label; ?></a></li>
                                <?php } ?>
                                <?php if(!empty($interkassa_check)) { ?>
                                <li><a id="link_interkassa" target="_blank" href="<?php echo $link_interkassa; ?>">
                                        <?php echo $link_interkassa_label; ?></a></li>
                                <?php } ?>
                            </ul>
                    <?php break;
                    case 1: ?>
                            <h3><?php echo $several_percent_label ?></h3>
                            <div style="padding-left: 15px;">
                                <?php foreach ($several_percent as $percent) { ?>
                                    <span id="several_percent">
                                        <input type="radio"
                                               name="several_percent_radio"
                                               value="<?php echo $percent['percent'] ?>"
                                        <?php if($several_percent_default==$percent['percent']){
                                        ?> checked="checked" <?php } ?> />
                                        <?php echo $percent['percent'] ?>% - <?php echo $percent['price']?>
                                    </span>
                                <?php } ?>
                            </div>
                            </br>
                            <h3><?php echo $list_payment_label; ?></h3>
                            <ul>
                                <?php if(!empty($alter_payment_check)) { ?>
                                <li><?php echo $alter_payment_text; ?></a></li>
                                <?php } ?>
                                <?php if(!empty($pay2pay_check)) { ?>
                                <li><a id="link_pay2pay" target="_blank" href="<?php echo $link_pay2pay; ?>">
                                        <?php echo $link_pay2pay_label; ?></a></li>
                                <?php } ?>
                                <?php if(!empty($robokassa_check)) { ?>
                                <li><a id="link_robokassa" target="_blank" href="<?php echo $link_robokassa; ?>">
                                        <?php echo $link_robokassa_label; ?></a></li>
                                <?php } ?>
                                <?php if(!empty($interkassa_check)) { ?>
                                <li><a id="link_interkassa" target="_blank" href="<?php echo $link_interkassa; ?>">
                                        <?php echo $link_interkassa_label; ?></a></li>
                                <?php } ?>
                            </ul>
                    <?php break;
                        case 2: ?>
                            <h3><?php echo $list_payment_label; ?></h3>
                            <ul>
                            <?php if(!empty($alter_payment_check)) { ?>
                            <li><?php echo $alter_payment_text; ?></a></li>
                            </ul>
                            <?php } ?>
                            <ul class="link_box_general">
                                <?php foreach($links_structure as $key => $links) { ?>
                                <li class="link_box">
                                    <h5><?php echo $links['text'] ?></h5>
                                    <ul>
                                        <?php foreach($links as $link) {
                                            switch($link['type']) {
                                            case 'link_pay2pay': ?>
                                                <?php if(!empty($pay2pay_check)) { ?>
                                                <li><a id="link_pay2pay<?php echo $link['percent'] ?>"
                                                       target="_blank"
                                                       href="<?php echo $link['link']; ?>">
                                                        <?php echo $link_pay2pay_label; ?></a></li>
                                                <?php } ?>
                                                <?php break;
                                            case 'link_robokassa': ?>
                                                <?php if(!empty($robokassa_check)) { ?>
                                                <li><a id="link_robokassa<?php echo $link['percent'] ?>"
                                                       target="_blank"
                                                       href="<?php echo $link['link']; ?>">
                                                        <?php echo $link_robokassa_label; ?></a></li>
                                                <?php } ?>
                                                <?php break;
                                            case 'link_interkassa': ?>
                                                <?php if(!empty($interkassa_check)) { ?>
                                                <li><a id="link_interkassa<?php echo $link['percent'] ?>"
                                                       target="_blank"
                                                       href="<?php echo $link['link']; ?>">
                                                        <?php echo $link_interkassa_label; ?></a></li>
                                                <?php } ?>
                                                <?php break; ?>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                </li>
                                <?php } ?>
                            </ul>
                    <?php break;
                        } ?>



                    <!-- PARAMETERS PAGE -->
                    <TABLE class="form">
                        <?php if($currency_code_check!=0) { ?>
                        <tr>
                            <td><? echo $currency_code_label; ?></td>
                            <td><?php echo $currency_code; ?></td>
                        </tr>
                        <?php } ?>

                        <?php if(isset($price) || $price!='') { ?>
                        <tr>
                            <td><? echo $price_label; ?></td>
                            <td><?php echo $price; ?></td>
                        </tr>
                        <?php } ?>

                        <?php if($receiver_of_product!='') { ?>
                        <tr>
                            <td><? echo $receiver_of_product_label; ?></td>
                            <td><?php echo $receiver_of_product; ?></td>
                        </tr>
                        <?php } ?>
                        <?php if($variable_value!='') { ?>
                        <tr>
                            <td><? echo $variable_name; ?></td>
                            <td><?php echo $variable_value; ?></td>
                        </tr>
                        <?php } ?>
                        <?php if($delivery_address!='') { ?>
                        <tr>
                            <td><? echo $delivery_address_label; ?></td>
                            <td><?php echo $delivery_address; ?></td>
                        </tr>
                        <?php } ?>

                        <?php if($delivery_method!='') { ?>
                        <tr>
                            <td><? echo $delivery_method_label; ?></td>
                            <td><?php echo $delivery_method; ?></td>
                        </tr>
                        <?php } ?>

                        <?php if($notes!='' && !$notes_up_position) { ?>
                        <tr>
                            <td><? echo $notes_label; ?></td>
                            <td><? echo $notes; ?></td>
                        </tr>
                        <?php } ?>
                    </TABLE>

                 <!--   <div class="row pagination_buttons">
                        <div class="col-xs-12 text-center">
                            <p><a class="btn btn-lg btn-primary"
                            href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a></p>
                        </div>
                    </div> -->
                    <p><?php echo $footer_label;?>
                        <a href="mailto:<?php echo $email_support; ?>"><?php echo $email_support; ?></a>
                    </p>
                    <small><?php echo $footer_small_label; ?></small>

                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
    </div>
</div>
<input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
<?php echo $footer; ?>

<script type="text/javascript">
    var type_of_presentation = '<?php echo $type_of_presentation; ?>';
    $(document).ready(function () {
        if(type_of_presentation==1) {
            getPercentOption();
            $('[name = "several_percent_radio"]').bind('change',function() {
                getPercentOption();
            });
        }
    });
    function getPercentOption() {
        $.ajax({
            url: 'index.php?route=information/page_order_bobs/post',
            dataType: 'json',
            data: 'percent=' + $("[name = 'several_percent_radio']").filter(':checked').val()+'&order_id='+
            $('[name = "order_id"]').val(),
            type:'post',
            beforeSend: function(){
                $('#link_pay2pay').addClass('link_disabled'); //link_disabled
                $('#link_robokassa').addClass('link_disabled'); //link_disabled
                $('#link_interkassa').addClass('link_disabled'); //link_disabled

            },
            success: function(json){
                // Здесь мы получаем данные, отправленные сервером и выводим их на экран.
                if(json.link_pay2pay!== undefined)
                {
                    $('#link_pay2pay').removeClass('link_disabled').attr("href", json.link_pay2pay);
                }
                if(json.link_robokassa!== undefined)
                {
                    $('#link_robokassa').removeClass('link_disabled').attr("href", json.link_robokassa);
                }
                if(json.link_interkassa!== undefined)
                {
                    $('#link_interkassa').removeClass('link_disabled').attr("href", json.link_interkassa);
                }

            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
//--></script>