<div class="tab-pane" id="{echo $aggregator->getId()}">
    <table class="table  table-bordered table-hover table-condensed content_big_td">
        <thead>
        <tr>
            <th colspan="6">
                {echo $aggregator->getName()}
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="6">
                <div class="inside_padd">
                    <div class="control-group">
                        {$fields}
                    </div>
                </div>

                <div class="control-group">
                    <a class="btn" href="{site_url('aggregator/service/' .$aggregator->getId())}">
                        { lang('Generate', 'aggregator')} {echo $aggregator->getName()}</a>
                    <a class="btn" href="{site_url('aggregator/service/' .$aggregator->getId())}/file" target="_blank">
                        { lang('Save to file', 'aggregator')} <i>{echo $aggregator->getName()}.xml</i></a>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>
