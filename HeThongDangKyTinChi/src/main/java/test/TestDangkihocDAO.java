package test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import model.Dangkihoc;
import model.Kihoc;
import model.Lophocphan;
import model.MonhocKihoc;
import model.SinhvienKhoa;

import dao.DAO;
import dao.DangkihocDAO;

import org.junit.Assert;
import org.junit.jupiter.api.Assertions;

class TestDangkihocDAO {
	
	DangkihocDAO dkhdao = new DangkihocDAO();
    
    @Test
    public void getDKcuaSV_testChuan1(){
        // sinh vien da dang ki dung 1 LHP
        int idSVK = 1;
        int idKihoc = 2;        
        ArrayList<Dangkihoc> listDK = dkhdao.getDKcuaSV(idSVK, idKihoc);
        Assert.assertNotNull(listDK);
        Assert.assertEquals(1, listDK.size());
        Assert.assertEquals(idSVK, listDK.get(0).getSinhvienKhoa().getId());
        Assert.assertEquals(idKihoc, listDK.get(0).getLophocphan().getMonhocKihoc().getKihoc().getId());
    }
    @Test
    public void getDKcuaSV_testChuan2(){
        // sinh vien dang ki nhieu hon 1 LHP
        int idSVK = 1;
        int idKihoc = 1;        
        ArrayList<Dangkihoc> listDK = dkhdao.getDKcuaSV(idSVK, idKihoc);
        Assert.assertNotNull(listDK);
        Assert.assertEquals(2, listDK.size());
        for(int i=0; i<listDK.size(); i++){
            Assert.assertEquals(idSVK, listDK.get(i).getSinhvienKhoa().getId());
            Assert.assertEquals(idKihoc, listDK.get(i).getLophocphan().getMonhocKihoc().getKihoc().getId());
        }
    }
    @Test
    public void getDKcuaSV_testNgoaile1(){
        //ki hoc ton tai, SV khong ton tai
        int idSVK = 1000;
        int idKihoc = 4;        
        ArrayList<Dangkihoc> listDK = dkhdao.getDKcuaSV(idSVK, idKihoc);
        Assert.assertNull(listDK);
    }
    @Test
    public void getDKcuaSV_testNgoaile2(){
        //ki hoc khong ton tai, SV ton tai
        int idSVK = 1;
        int idKihoc = 1000;     
        ArrayList<Dangkihoc> listDK = dkhdao.getDKcuaSV(idSVK, idKihoc);
        Assert.assertNull(listDK);
    }
    @Test
    public void getDKcuaSV_testNgoaile3(){
        //ki hoc khong ton tai, SV khong ton tai
        int idSVK = 1000;
        int idKihoc = 1000;     
        ArrayList<Dangkihoc> listDK = dkhdao.getDKcuaSV(idSVK, idKihoc);
        Assert.assertNull(listDK);
    }
    @Test
    public void getDKcuaSV_testNgoaile4(){
        //SV co dang ki o ki hoc khac, khong co dang ki o ki hoc nay
        int idSVK = 1;
        int idKihoc = 5;        
        ArrayList<Dangkihoc> listDK = dkhdao.getDKcuaSV(idSVK, idKihoc);
        Assert.assertNull(listDK);
    }
    
    @Test
    public void luuDKcuaSV_testChuan1(){
        //dang ki 1LHP, chua co dang ki cu
        ArrayList<Dangkihoc> listDK = new ArrayList<Dangkihoc>();
        //tao dang ki hoc thu nhat
        SinhvienKhoa svk = new SinhvienKhoa();
        svk.setId(1);
        Kihoc kh = new Kihoc();
        kh.setId(1);
        MonhocKihoc mhkh = new MonhocKihoc();
        mhkh.setId(1);
        mhkh.setKihoc(kh);
        Lophocphan lhp = new Lophocphan();
        lhp.setId(1);
        lhp.setMonhocKihoc(mhkh);
        Dangkihoc dk = new Dangkihoc();
        dk.setSinhvienKhoa(svk);
        dk.setLophocphan(lhp);
        listDK.add(dk);
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertTrue(ok);
             
            //lay ra kiem tra
            ArrayList<Dangkihoc> listDKnew = dkhdao.getDKcuaSV(svk.getId(), kh.getId());
            Assert.assertNotNull(listDKnew);
            Assert.assertEquals(1, listDKnew.size());
            Assert.assertEquals(svk.getId(), listDKnew.get(0).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp.getId(), listDKnew.get(0).getLophocphan().getId());         
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    @Test
    public void luuDKcuaSV_testChuan2(){
        //dang ki nhieu LHP, chua co dang ki cu
        ArrayList<Dangkihoc> listDK = new ArrayList<Dangkihoc>();
        //tao dang ki hoc thu nhat
        SinhvienKhoa svk = new SinhvienKhoa();
        svk.setId(1);
        Kihoc kh = new Kihoc();
        kh.setId(1);
        MonhocKihoc mhkh = new MonhocKihoc();
        mhkh.setId(1);
        mhkh.setKihoc(kh);
        Lophocphan lhp = new Lophocphan();
        lhp.setId(1);
        lhp.setMonhocKihoc(mhkh);
        Dangkihoc dk = new Dangkihoc();
        dk.setSinhvienKhoa(svk);
        dk.setLophocphan(lhp);
        listDK.add(dk);
         
        //tao dang ki hoc thu hai       
        MonhocKihoc mhkh2 = new MonhocKihoc();
        mhkh2.setId(2);
        mhkh2.setKihoc(kh);
        Lophocphan lhp2 = new Lophocphan();
        lhp2.setId(2);
        lhp2.setMonhocKihoc(mhkh2);
        Dangkihoc dk2 = new Dangkihoc();
        dk2.setSinhvienKhoa(svk);
        dk2.setLophocphan(lhp2);
        listDK.add(dk2);
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertTrue(ok);
             
            //lay ra kiem tra
            ArrayList<Dangkihoc> listDKnew = dkhdao.getDKcuaSV(svk.getId(), kh.getId());
            Assert.assertNotNull(listDKnew);
            Assert.assertEquals(2, listDKnew.size());
            Assert.assertEquals(svk.getId(), listDKnew.get(0).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp.getId(), listDKnew.get(0).getLophocphan().getId()); 
            Assert.assertEquals(svk.getId(), listDKnew.get(1).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp2.getId(), listDKnew.get(1).getLophocphan().getId());
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    @Test
    public void luuDKcuaSV_testChuan3(){
        // dang ki 1LHP, cung MH voi dang ki cu, dang ki cu cung chi co 1LHP
        ArrayList<Dangkihoc> listDK = new ArrayList<Dangkihoc>();
        //tao dang ki hoc thu nhat
        SinhvienKhoa svk = new SinhvienKhoa();
        svk.setId(1);
        Kihoc kh = new Kihoc();
        kh.setId(1);
        MonhocKihoc mhkh = new MonhocKihoc();
        mhkh.setId(1);
        mhkh.setKihoc(kh);
        Lophocphan lhp = new Lophocphan();
        lhp.setId(1);
        lhp.setMonhocKihoc(mhkh);
        Dangkihoc dk = new Dangkihoc();
        dk.setSinhvienKhoa(svk);
        dk.setLophocphan(lhp);
        listDK.add(dk);
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertTrue(ok);
             
            //lay ra kiem tra
            ArrayList<Dangkihoc> listDKnew = dkhdao.getDKcuaSV(svk.getId(), kh.getId());
            Assert.assertNotNull(listDKnew);
            Assert.assertEquals(1, listDKnew.size());
            Assert.assertEquals(svk.getId(), listDKnew.get(0).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp.getId(), listDKnew.get(0).getLophocphan().getId());         
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    @Test
    public void luuDKcuaSV_testChuan4(){
        // dang ki 1LHP, khac MH voi dang ki cu, dang ki cu cung chi co 1LHP
        ArrayList<Dangkihoc> listDK = new ArrayList<Dangkihoc>();
        //tao dang ki hoc thu nhat
        SinhvienKhoa svk = new SinhvienKhoa();
        svk.setId(1);
        Kihoc kh = new Kihoc();
        kh.setId(1);
        MonhocKihoc mhkh = new MonhocKihoc();
        mhkh.setId(1);
        mhkh.setKihoc(kh);
        Lophocphan lhp = new Lophocphan();
        lhp.setId(1);
        lhp.setMonhocKihoc(mhkh);
        Dangkihoc dk = new Dangkihoc();
        dk.setSinhvienKhoa(svk);
        dk.setLophocphan(lhp);
        listDK.add(dk);
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertTrue(ok);
             
            //lay ra kiem tra
            ArrayList<Dangkihoc> listDKnew = dkhdao.getDKcuaSV(svk.getId(), kh.getId());
            Assert.assertNotNull(listDKnew);
            Assert.assertEquals(1, listDKnew.size());
            Assert.assertEquals(svk.getId(), listDKnew.get(0).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp.getId(), listDKnew.get(0).getLophocphan().getId());         
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    @Test
    public void luuDKcuaSV_testChuan5(){
        // dang ki > 1LHP, dang ki cu it LHP hon
        ArrayList<Dangkihoc> listDK = new ArrayList<Dangkihoc>();
        //tao dang ki hoc thu nhat
        SinhvienKhoa svk = new SinhvienKhoa();
        svk.setId(1);
        Kihoc kh = new Kihoc();
        kh.setId(1);
        MonhocKihoc mhkh = new MonhocKihoc();
        mhkh.setId(1);
        mhkh.setKihoc(kh);
        Lophocphan lhp = new Lophocphan();
        lhp.setId(1);
        lhp.setMonhocKihoc(mhkh);
        Dangkihoc dk = new Dangkihoc();
        dk.setSinhvienKhoa(svk);
        dk.setLophocphan(lhp);
        listDK.add(dk);
         
        //tao dang ki hoc thu hai       
        MonhocKihoc mhkh2 = new MonhocKihoc();
        mhkh2.setId(2);
        mhkh2.setKihoc(kh);
        Lophocphan lhp2 = new Lophocphan();
        lhp2.setId(2);
        lhp2.setMonhocKihoc(mhkh2);
        Dangkihoc dk2 = new Dangkihoc();
        dk2.setSinhvienKhoa(svk);
        dk2.setLophocphan(lhp2);
        listDK.add(dk2);
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertTrue(ok);
             
            //lay ra kiem tra
            ArrayList<Dangkihoc> listDKnew = dkhdao.getDKcuaSV(svk.getId(), kh.getId());
            Assert.assertNotNull(listDKnew);
            Assert.assertEquals(2, listDKnew.size());
            Assert.assertEquals(svk.getId(), listDKnew.get(0).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp.getId(), listDKnew.get(0).getLophocphan().getId()); 
            Assert.assertEquals(svk.getId(), listDKnew.get(1).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp2.getId(), listDKnew.get(1).getLophocphan().getId());
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    @Test
    public void luuDKcuaSV_testChuan6(){
        // dang ki > 1LHP, dang ki cu nhieu LHP hon
        ArrayList<Dangkihoc> listDK = new ArrayList<Dangkihoc>();
        //tao dang ki hoc thu nhat
        SinhvienKhoa svk = new SinhvienKhoa();
        svk.setId(1);
        Kihoc kh = new Kihoc();
        kh.setId(1);
        MonhocKihoc mhkh = new MonhocKihoc();
        mhkh.setId(1);
        mhkh.setKihoc(kh);
        Lophocphan lhp = new Lophocphan();
        lhp.setId(1);
        lhp.setMonhocKihoc(mhkh);
        Dangkihoc dk = new Dangkihoc();
        dk.setSinhvienKhoa(svk);
        dk.setLophocphan(lhp);
        listDK.add(dk);
         
        //tao dang ki hoc thu hai       
        MonhocKihoc mhkh2 = new MonhocKihoc();
        mhkh2.setId(2);
        mhkh2.setKihoc(kh);
        Lophocphan lhp2 = new Lophocphan();
        lhp2.setId(2);
        lhp2.setMonhocKihoc(mhkh2);
        Dangkihoc dk2 = new Dangkihoc();
        dk2.setSinhvienKhoa(svk);
        dk2.setLophocphan(lhp2);
        listDK.add(dk2);
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertTrue(ok);
             
            //lay ra kiem tra
            ArrayList<Dangkihoc> listDKnew = dkhdao.getDKcuaSV(svk.getId(), kh.getId());
            Assert.assertNotNull(listDKnew);
            Assert.assertEquals(2, listDKnew.size());
            Assert.assertEquals(svk.getId(), listDKnew.get(0).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp.getId(), listDKnew.get(0).getLophocphan().getId()); 
            Assert.assertEquals(svk.getId(), listDKnew.get(1).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp2.getId(), listDKnew.get(1).getLophocphan().getId());
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    @Test
    public void luuDKcuaSV_testNgoaile1(){
        //dang ki moi trung hoan toan voi dang ki cu
        ArrayList<Dangkihoc> listDK = new ArrayList<Dangkihoc>();
        //tao dang ki hoc thu nhat
        SinhvienKhoa svk = new SinhvienKhoa();
        svk.setId(1);
        Kihoc kh = new Kihoc();
        kh.setId(1);
        MonhocKihoc mhkh = new MonhocKihoc();
        mhkh.setId(1);
        mhkh.setKihoc(kh);
        Lophocphan lhp = new Lophocphan();
        lhp.setId(1);
        lhp.setMonhocKihoc(mhkh);
        Dangkihoc dk = new Dangkihoc();
        dk.setSinhvienKhoa(svk);
        dk.setLophocphan(lhp);
        listDK.add(dk);
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertTrue(ok);
             
            //lay ra kiem tra
            ArrayList<Dangkihoc> listDKnew = dkhdao.getDKcuaSV(svk.getId(), kh.getId());
            Assert.assertNotNull(listDKnew);
            Assert.assertEquals(1, listDKnew.size());
            Assert.assertEquals(svk.getId(), listDKnew.get(0).getSinhvienKhoa().getId());
            Assert.assertEquals(lhp.getId(), listDKnew.get(0).getLophocphan().getId());         
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    @Test
    public void luuDKcuaSV_testNgoaile2(){
        //dang ki moi khong co LHP nao
        ArrayList<Dangkihoc> listDK = null;
         
        try{
            DAO.con.setAutoCommit(false);
            boolean ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertFalse(ok);
             
            //test 2
            listDK = new ArrayList<Dangkihoc>();
            ok = dkhdao.luuDKcuaSV(listDK);
            Assert.assertFalse(ok); 
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }

}
