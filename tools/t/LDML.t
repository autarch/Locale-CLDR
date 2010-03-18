use strict;
use warnings;
use utf8;

use Cwd qw( abs_path );
use Path::Class;
use Test::More;

use LDML;

my $data_dir = abs_path( '../cldr-data' );

{
    my $ldml = LDML->new_from_file("$data_dir/en_US.xml");

    my @data = (
        id => 'en_US',

        en_language  => 'English',
        en_script    => undef,
        en_territory => 'United States',
        en_variant   => undef,

        native_language  => 'English',
        native_script    => undef,
        native_territory => 'United States',
        native_variant   => undef,

        day_format_narrow      => [qw( M T W T F S S )],
        day_format_abbreviated => [qw( Mon Tue Wed Thu Fri Sat Sun )],
        day_format_wide =>
            [qw( Monday Tuesday Wednesday Thursday Friday Saturday Sunday )],
        day_stand_alone_narrow      => [qw( M T W T F S S )],
        day_stand_alone_abbreviated => [qw( Mon Tue Wed Thu Fri Sat Sun )],
        day_stand_alone_wide =>
            [qw( Monday Tuesday Wednesday Thursday Friday Saturday Sunday )],

        month_format_narrow => [qw( J F M A M J J A S O N D )],
        month_format_abbreviated =>
            [qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec )],
        month_format_wide => [
            qw( January February March April May June July August September October November December )
        ],
        month_stand_alone_narrow => [qw( J F M A M J J A S O N D )],
        month_stand_alone_abbreviated =>
            [qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec )],
        month_stand_alone_wide => [
            qw( January February March April May June July August September October November December )
        ],

        quarter_format_narrow      => [qw( 1 2 3 4 )],
        quarter_format_abbreviated => [qw( Q1 Q2 Q3 Q4 )],
        quarter_format_wide =>
            [ '1st quarter', '2nd quarter', '3rd quarter', '4th quarter' ],
        quarter_stand_alone_narrow      => [qw( 1 2 3 4 )],
        quarter_stand_alone_abbreviated => [qw( Q1 Q2 Q3 Q4 )],
        quarter_stand_alone_wide =>
            [ '1st quarter', '2nd quarter', '3rd quarter', '4th quarter' ],

        am_pm_abbreviated => [qw( AM PM )],

        era_narrow      => [qw( B A )],
        era_abbreviated => [qw( BC AD )],
        era_wide        => [ 'Before Christ', 'Anno Domini' ],

        date_format_full   => 'EEEE, MMMM d, y',
        date_format_long   => 'MMMM d, y',
        date_format_medium => 'MMM d, y',
        date_format_short  => 'M/d/yy',

        time_format_full   => 'h:mm:ss a zzzz',
        time_format_long   => 'h:mm:ss a z',
        time_format_medium => 'h:mm:ss a',
        time_format_short  => 'h:mm a',

        datetime_format => '{1} {0}',

        default_date_format_length => 'medium',
        default_time_format_length => 'medium',

        default_interval_format => "{0} \x{2013} {1}",

        merged_interval_formats => {
            'yMMMd' => {
                'y' => "yyyy-MM-dd \x{2013} yyyy-MM-dd",
                'M' => "yyyy-MM-dd \x{2013} MM-d",
                'd' => "yyyy-MM-d \x{2013} d"
            },
            'd'      => { 'd' => 'd-d' },
            'yMMMEd' => {
                'y' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'M' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'd' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd"
            },
            'y'  => { 'y' => 'y-y' },
            'hv' => {
                'a' => 'HH-HH v',
                'h' => 'HH-HH v'
            },
            'yMMMM' => {
                'y' => "yyyy-MM \x{2013} yyyy-MM",
                'M' => "yyyy-MM \x{2013} MM"
            },
            'h' => {
                'a' => 'HH-HH',
                'h' => 'HH-HH'
            },
            'M'   => { 'M' => 'M-M' },
            'yMd' => {
                'y' => "yyyy-MM-dd \x{2013} yyyy-MM-dd",
                'M' => "yyyy-MM-dd \x{2013} MM-dd",
                'd' => "yyyy-MM-dd \x{2013} dd"
            },
            'MMM' => { 'M' => 'LLL-LLL' },
            'MEd' => {
                'M' => "E, MM-dd \x{2013} E, MM-dd",
                'd' => "E, MM-dd \x{2013} E, MM-dd"
            },
            'yM' => {
                'y' => "yyyy-MM \x{2013} yyyy-MM",
                'M' => "yyyy-MM \x{2013} MM"
            },
            'Md' => {
                'M' => "MM-dd \x{2013} MM-dd",
                'd' => "MM-dd \x{2013} dd"
            },
            'yMEd' => {
                'y' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'M' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'd' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd"
            },
            'hm' => {
                'a' => 'HH:mm-HH:mm',
                'h' => 'HH:mm-HH:mm',
                'm' => 'HH:mm-HH:mm'
            },
            'hmv' => {
                'a' => 'HH:mm-HH:mm v',
                'h' => 'HH:mm-HH:mm v',
                'm' => 'HH:mm-HH:mm v'
            },
            'MMMEd' => {
                'M' => "E, MM-d \x{2013} E, MM-d",
                'd' => "E, MM-d \x{2013} E, MM-d"
            },
            'MMMM' => { 'M' => 'LLLL-LLLL' },
            'MMMd' => {
                'M' => "MM-d \x{2013} MM-d",
                'd' => "MM-d \x{2013} d"
            },
            'yMMM' => {
                'y' => "yyyy-MM \x{2013} yyyy-MM",
                'M' => "yyyy-MM \x{2013} MM"
            },
        },

        merged_field_names => {
            era   => { name => 'Era' },
            year  => { name => 'Year' },
            month => { name => 'Month' },
            week  => { name => 'Week' },
            day   => {
                name => 'Day',
                '-1' => 'Yesterday',
                '0'  => 'Today',
                '1'  => 'Tomorrow',
            },
            weekday   => { name => 'Day of the Week' },
            dayperiod => { name => 'AM/PM' },
            hour      => { name => 'Hour' },
            minute    => { name => 'Minute' },
            second    => { name => 'Second' },
            zone      => { name => 'Zone' },
        },

        merged_available_formats => {

            # from en
            d      => 'd',
            EEEd   => 'd EEE',
            hm     => 'h:mm a',
            Hm     => 'H:mm',
            Hms    => 'H:mm:ss',
            M      => 'L',
            MMM    => 'LLL',
            MMMd   => 'MMM d',
            MMMMEd => 'E, MMMM d',
            ms     => 'mm:ss',
            y      => 'y',
            yM     => 'M/yyyy',
            yMMM   => 'MMM y',
            yMMMEd => 'EEE, MMM d, y',
            yMMMM  => 'MMMM y',
            yQ     => 'Q yyyy',
            yQQQ   => 'QQQ y',

            # from root
            hms => 'h:mm:ss a',
        },

        first_day_of_week => 7,
    );

    test_data( $ldml, \@data );
}
exit;
{
    my $ldml = LDML->new(
        id          => 'cop_Arab_EG',
        source_file => file($0),
        document    => XML::LibXML::Document->new(),
    );
    is_deeply(
        [ $ldml->_parse_id() ],
        [ 'cop', 'Arab', 'EG', undef ],
        '_parse_id for cop_Arab_EG'
    );
}

{
    my $ldml = LDML->new(
        id          => 'hy_AM_REVISED',
        source_file => file($0),
        document    => XML::LibXML::Document->new(),
    );
    is_deeply(
        [ $ldml->_parse_id() ],
        [ 'hy', undef, 'AM', 'REVISED' ],
        '_parse_id for hy_AM_REVISED'
    );
}

{
    # There are no ids with all four parts as of CLDR 1.5.1 but just
    # in case it ever happens ...
    my $ldml = LDML->new(
        id          => 'wo_Latn_SN_REVISED',
        source_file => file($0),
        document    => XML::LibXML::Document->new(),
    );
    is_deeply(
        [ $ldml->_parse_id() ],
        [ 'wo', 'Latn', 'SN', 'REVISED' ],
        '_parse_id for wo_Latn_SN_REVISED'
    );
}

{
    my $ldml = LDML->new_from_file("$data_dir/zh_MO.xml");

    is( $ldml->alias_to(), 'zh_Hant_MO', 'zh_MO is an alias to zh_Hant_MO' );
}

{
    my $ldml = LDML->new_from_file("$data_dir/root.xml");

    my @data = (
        id              => 'root',
        version         => '1.192',
        generation_date => '2009/06/15 21:39:59',
        _parent_ids     => [],
        source_file     => file("$data_dir/root.xml"),

        en_language  => 'Root',
        en_script    => undef,
        en_territory => undef,
        en_variant   => undef,

        native_language  => undef,
        native_script    => undef,
        native_territory => undef,
        native_variant   => undef,

        day_format_narrow           => [ 2 .. 7, 1 ],
        day_format_abbreviated      => [ 2 .. 7, 1 ],
        day_format_wide             => [ 2 .. 7, 1 ],
        day_stand_alone_narrow      => [ 2 .. 7, 1 ],
        day_stand_alone_abbreviated => [ 2 .. 7, 1 ],
        day_stand_alone_wide        => [ 2 .. 7, 1 ],

        month_format_narrow           => [ 1 .. 12 ],
        month_format_abbreviated      => [ 1 .. 12 ],
        month_format_wide             => [ 1 .. 12 ],
        month_stand_alone_narrow      => [ 1 .. 12 ],
        month_stand_alone_abbreviated => [ 1 .. 12 ],
        month_stand_alone_wide        => [ 1 .. 12 ],

        quarter_format_narrow           => [ 1 .. 4 ],
        quarter_format_abbreviated      => [ map { 'Q' . $_ } 1 .. 4 ],
        quarter_format_wide             => [ map { 'Q' . $_ } 1 .. 4 ],
        quarter_stand_alone_narrow      => [ 1 .. 4 ],
        quarter_stand_alone_abbreviated => [ map { 'Q' . $_ } 1 .. 4 ],
        quarter_stand_alone_wide        => [ map { 'Q' . $_ } 1 .. 4 ],

        am_pm_abbreviated => [qw( AM PM )],

        era_wide        => [qw( BCE CE )],
        era_abbreviated => [qw( BCE CE )],
        era_narrow      => [qw( BCE CE )],

        date_format_full   => 'EEEE, y MMMM dd',
        date_format_long   => 'y MMMM d',
        date_format_medium => 'y MMM d',
        date_format_short  => 'yyyy-MM-dd',

        time_format_full   => 'HH:mm:ss zzzz',
        time_format_long   => 'HH:mm:ss z',
        time_format_medium => 'HH:mm:ss',
        time_format_short  => 'HH:mm',

        datetime_format => '{1} {0}',

        default_date_format_length => 'medium',
        default_time_format_length => 'medium',

        merged_available_formats => {
            d      => 'd',
            EEEd   => 'd EEE',
            hm     => 'h:mm a',
            Hm     => 'H:mm',
            hms    => 'h:mm:ss a',
            Hms    => 'H:mm:ss',
            M      => 'L',
            Md     => 'M-d',
            MEd    => 'E, M-d',
            MMM    => 'LLL',
            MMMd   => 'MMM d',
            MMMEd  => 'E MMM d',
            MMMMd  => 'MMMM d',
            MMMMEd => 'E MMMM d',
            ms     => 'mm:ss',
            y      => 'y',
            yM     => 'y-M',
            yMEd   => 'EEE, y-M-d',
            yMMM   => 'y MMM',
            yMMMEd => 'EEE, y MMM d',
            yMMMM  => 'y MMMM',
            yQ     => 'y Q',
            yQQQ   => 'y QQQ',
        },

        default_interval_format => "{0} \x{2013} {1}",

        merged_interval_formats => {
            'yMMMd' => {
                'y' => "yyyy-MM-dd \x{2013} yyyy-MM-dd",
                'M' => "yyyy-MM-dd \x{2013} MM-d",
                'd' => "yyyy-MM-d \x{2013} d"
            },
            'd'      => { 'd' => 'd-d' },
            'yMMMEd' => {
                'y' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'M' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'd' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd"
            },
            'y'  => { 'y' => 'y-y' },
            'hv' => {
                'a' => 'HH-HH v',
                'h' => 'HH-HH v'
            },
            'yMMMM' => {
                'y' => "yyyy-MM \x{2013} yyyy-MM",
                'M' => "yyyy-MM \x{2013} MM"
            },
            'h' => {
                'a' => 'HH-HH',
                'h' => 'HH-HH'
            },
            'M'   => { 'M' => 'M-M' },
            'yMd' => {
                'y' => "yyyy-MM-dd \x{2013} yyyy-MM-dd",
                'M' => "yyyy-MM-dd \x{2013} MM-dd",
                'd' => "yyyy-MM-dd \x{2013} dd"
            },
            'MMM' => { 'M' => 'LLL-LLL' },
            'MEd' => {
                'M' => "E, MM-dd \x{2013} E, MM-dd",
                'd' => "E, MM-dd \x{2013} E, MM-dd"
            },
            'yM' => {
                'y' => "yyyy-MM \x{2013} yyyy-MM",
                'M' => "yyyy-MM \x{2013} MM"
            },
            'Md' => {
                'M' => "MM-dd \x{2013} MM-dd",
                'd' => "MM-dd \x{2013} dd"
            },
            'yMEd' => {
                'y' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'M' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd",
                'd' => "E, yyyy-MM-dd \x{2013} E, yyyy-MM-dd"
            },
            'hm' => {
                'a' => 'HH:mm-HH:mm',
                'h' => 'HH:mm-HH:mm',
                'm' => 'HH:mm-HH:mm'
            },
            'hmv' => {
                'a' => 'HH:mm-HH:mm v',
                'h' => 'HH:mm-HH:mm v',
                'm' => 'HH:mm-HH:mm v'
            },
            'MMMEd' => {
                'M' => "E, MM-d \x{2013} E, MM-d",
                'd' => "E, MM-d \x{2013} E, MM-d"
            },
            'MMMM' => { 'M' => 'LLLL-LLLL' },
            'MMMd' => {
                'M' => "MM-d \x{2013} MM-d",
                'd' => "MM-d \x{2013} d"
            },
            'yMMM' => {
                'y' => "yyyy-MM \x{2013} yyyy-MM",
                'M' => "yyyy-MM \x{2013} MM"
            },
        },

        merged_field_names => {
            era   => { name => 'Era' },
            year  => { name => 'Year' },
            month => { name => 'Month' },
            week  => { name => 'Week' },
            day   => {
                name => 'Day',
                '-1' => 'Yesterday',
                '0'  => 'Today',
                '1'  => 'Tomorrow',
            },
            weekday   => { name => 'Day of the Week' },
            dayperiod => { name => 'Dayperiod' },
            hour      => { name => 'Hour' },
            minute    => { name => 'Minute' },
            second    => { name => 'Second' },
            zone      => { name => 'Zone' },
        },

        first_day_of_week => 1,
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/ssy.xml");

    my @data = (
        id              => 'ssy',
        version         => '1.1',
        generation_date => '2007/07/19 20:48:11',

        language    => 'ssy',
        script      => undef,
        territory   => undef,
        variant     => undef,
        _parent_ids => ['root'],
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/en_GB.xml");

    my @data = (
        id          => 'en_GB',
        language    => 'en',
        script      => undef,
        territory   => 'GB',
        variant     => undef,
        _parent_ids => ['en'],

        merged_available_formats => {
            Md       => 'd/M',
            MEd      => 'E, d/M',
            MMdd     => 'dd/MM',
            MMMEd    => 'E d MMM',
            MMMMd    => 'd MMMM',
            yMEd     => 'EEE, d/M/yyyy',
            yyMMM    => 'MMM yy',
            yyyyMM   => 'MM/yyyy',
            yyyyMMMM => 'MMMM y',

            # from en
            d      => 'd',
            EEEd   => 'd EEE',
            hm     => 'h:mm a',
            Hm     => 'H:mm',
            Hms    => 'H:mm:ss',
            M      => 'L',
            MMM    => 'LLL',
            MMMd   => 'MMM d',
            MMMMEd => 'E, MMMM d',
            ms     => 'mm:ss',
            y      => 'y',
            yM     => 'M/yyyy',
            yMMM   => 'MMM y',
            yMMMEd => 'EEE, MMM d, y',
            yMMMM  => 'MMMM y',
            yQ     => 'Q yyyy',
            yQQQ   => 'QQQ y',

            # from root
            hms => 'h:mm:ss a',
        },

        first_day_of_week => 7,
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/az.xml");

    my @data = (
        id => 'az',

        day_format_wide => [
            'bazar ertəsi',
            'çərşənbə axşamı',
            'çərşənbə',
            'cümə axşamı',
            'cümə',
            'şənbə',
            'bazar'
        ],
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/gaa.xml");

    my @data = (
        id => 'gaa',

        day_format_abbreviated => [qw( Dzu Dzf Sho Soo Soh Ho Hog )],
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/ve.xml");

    my @data = (
        id => 've',

        month_format_abbreviated =>
            [qw( Pha Luh Ṱhf Lam Shu Lwi Lwa Ṱha Khu Tsh Ḽar Nye )],
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/ti.xml");

    cmp_ok(
        scalar @{
            [
                $ldml->document()->documentElement()
                    ->findnodes('localeDisplayNames/territories/territory')
            ]
            },
        '>', 2,
        'ti alias to am for territories was resolved properly'
    );
}

{
    my $ldml = LDML->new_from_file("$data_dir/zh_Hant_TW.xml");

    my @data = (
        id => 'zh_Hant_TW',

        en_language  => 'Chinese',
        en_script    => 'Traditional Han',
        en_territory => 'Taiwan',
        en_variant   => undef,

        native_language  => '中文',
        native_script    => '繁體中文',
        native_territory => '台灣',
        native_variant   => undef,

        merged_field_names => {
            era   => { name => '年代' },
            year  => { name => '年' },
            month => { name => '月' },
            week  => { name => '週' },
            day   => {
                name => '日',
                '-3' => '大前天',
                '-2' => '前天',
                '-1' => '昨天',
                '0'  => '今天',
                '1'  => '明天',
                '2'  => '後天',
                '3'  => '大後天',
            },
            weekday   => { name => '週天' },
            dayperiod => { name => '上午/下午' },
            hour      => { name => '小時' },
            minute    => { name => '分鐘' },
            second    => { name => '秒' },
            zone      => { name => '區域' },
        },
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/de_AT.xml");

    my @data = (
        id => 'de_AT',

        month_format_wide => [
            qw( Jänner
                Februar
                März
                April
                Mai
                Juni
                Juli
                August
                September
                Oktober
                November
                Dezember
                )
        ],
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/bg.xml");

    my @data = (
        id => 'bg',

        era_narrow => [ 'BCE', 'сл.н.е.' ],
    );

    test_data( $ldml, \@data );
}

{
    my $ldml = LDML->new_from_file("$data_dir/nn.xml");

    is_deeply(
        [ $ldml->parent_ids() ],
        [qw( nb da sv en root )],
        'parent_ids for nn'
    );

    is_deeply(
        [ map { $_->id() } $ldml->_self_and_ancestors() ],
        [qw( nn nb da sv en root )],
        'ancestors for nn does not cause endless recursion'
    );
}

{
    my $ldml = LDML->new_from_file("$data_dir/is.xml");

    is_deeply(
        [ $ldml->parent_ids() ],
        [qw( nn sv nb da en root )],
        'parent_ids for is'
    );

    is_deeply(
        $ldml->day_format_narrow(),
        [qw( 2 3 4 5 6 7 1 )],
        'day_format_narrow for is does not cause endless recursion'
    );
}

{
    my $ldml = LDML->new_from_file("$data_dir/zh_Hans_SG.xml");

    my @data = (
        day_format_abbreviated =>
            [qw( 周一 周二 周三 周四 周五 周六 周日 )],
    );

    test_data( $ldml, \@data );
}

done_testing();

sub test_data {
    my $ldml = shift;
    my $data = shift;

    local $Test::Builder::Level = $Test::Builder::Level + 1;

    for ( my $i = 0; $i < @{$data}; $i += 2 ) {
        my $meth = $data->[$i];

        is_deeply(
            $ldml->$meth(),
            $data->[ $i + 1 ],
            "$meth in " . $ldml->id()
        );
    }
}
