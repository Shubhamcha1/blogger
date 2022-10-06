import select2 from "select2"
select2();

$('.select').select2({
    tags: true,
    tokenSeparators: [',', ' ']
});

