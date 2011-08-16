package Spark::Wheel::Textarea::Renderer::HTML;

sub render {
    my ($self,$context) = @_;
    return sprintf(
        q(<textarea name="%s">%s</textarea>),
        $context->node->name,
        $context->data($context->node->name),
    );
}

1;
__END__
