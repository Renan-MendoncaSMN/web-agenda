package entidades;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Agendamento {

    private Integer idAgendamento;
    private String assunto;
    private String descricao;
    private Date dataAgendamento;
    private Date dataCadastro;
    private Date dataAlteracao;
    private Boolean emailNotificacao;
    private String urlRedirecionamento;
    private Integer idUsuario = 147;
    private byte idStatus;


    public Agendamento(String assunto, String descricao, Date dataAgendamento, Boolean emailNotificacao2,
                       String urlRedirecionamento) {
        this.assunto = assunto;
        this.descricao = descricao;
        this.dataAgendamento = dataAgendamento;
        this.emailNotificacao = emailNotificacao2;
        this.urlRedirecionamento = urlRedirecionamento;
    }

    public Agendamento(Integer idAgendamento, String assunto, String descricao, Date dataAgendamento, Date dataCadastro,
                       Date dataAlteracao, Boolean emailNotificacao, String urlRedirecionamento, Integer idUsuario,
                       byte idStatus) {
        this.idAgendamento = idAgendamento;
        this.assunto = assunto;
        this.descricao = descricao;
        this.dataAgendamento = dataAgendamento;
        this.dataCadastro = dataCadastro;
        this.dataAlteracao = dataAlteracao;
        this.emailNotificacao = emailNotificacao;
        this.urlRedirecionamento = urlRedirecionamento;
        this.idUsuario = idUsuario;
        this.idStatus = idStatus;
    }

    public enum status {
        Pendente, Futura, Atrasada, Resolvida, Cancelada
    }

    public String getDescricaoStatus() throws ParseException {
        String descricao = "";

        switch (getIdStatus()) {
            case 1:
                descricao = status.Pendente.toString();
                break;
            case 2:
                descricao = status.Futura.toString();
                break;
            case 3:
                descricao = status.Atrasada.toString();
                break;
            case 4:
                descricao = status.Resolvida.toString();
                break;
            case 5:
                descricao = status.Cancelada.toString();
                break;
        }

        return descricao;
    }

    public Integer getIdAgendamento() {
        return idAgendamento;
    }

    public void setIdAgendamento(Integer idAgendamento) {
        this.idAgendamento = idAgendamento;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getDataAgendamento() {
        return dataAgendamento;
    }

    public void setDataAgendamento(Date dataAgendamento) {
        this.dataAgendamento = dataAgendamento;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public Date getDataAlteracao() {
        return dataAlteracao;
    }

    public void setDataAlteracao(Date dataAlteracao) {
        this.dataAlteracao = dataAlteracao;
    }

    public Boolean getEmailNotificacao() {
        return emailNotificacao;
    }

    public void setEmailNotificacao(Boolean emailNotificacao) {
        this.emailNotificacao = emailNotificacao;
    }

    public String getUrlRedirecionamento() {
        return urlRedirecionamento;
    }

    public void setUrlRedirecionamento(String urlRedirecionamento) {
        this.urlRedirecionamento = urlRedirecionamento;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public byte getIdStatus() throws ParseException {
        SimpleDateFormat formatar = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        Date hoje = formatar.parse(formatar.format(new Date()));

        if (idStatus == 1 && hoje.after(getDataAgendamento())) {
            return 3;
        }
        if (idStatus == 1 && getDataAgendamento().after(hoje)) {
            return 2;
        }

        return idStatus;
    }

    public void setIdStatus(byte idStatus) {
        this.idStatus = idStatus;
    }
}

